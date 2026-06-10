// qmllint disable unqualified
import QtQuick
import QtQuick.Effects
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import "../styles"
import "../themes"

WrapperRectangle {
    id: button

    property string text
    property string tooltip
    property string iconLeft
    property string iconRight
    property int iconSize: 18
    property int fontSize: Fonts.mainFontSize
    property int padding: 10
    property color backgroundColor: Mocha.crust
    property color foregroundColor: Mocha.text
    property bool active: false
    property var cursorShape: Qt.PointingHandCursor

    signal leftClick
    signal rightClick

    color: active ? Mocha.red : backgroundColor
    rightMargin: padding
    leftMargin: padding
    radius: 4

    implicitWidth: buttonContent.implicitWidth + leftMargin + rightMargin
    implicitHeight: Math.max(36, buttonContent.implicitHeight)

    RowLayout {
        id: buttonContent
        anchors.centerIn: parent
        spacing: button.padding

        Image {
            id: buttonIconLeft
            visible: button.iconLeft !== "" && button.foregroundColor === Mocha.text
            source: button.iconLeft ? Quickshell.iconPath(button.iconLeft) : ""
            sourceSize: Qt.size(32, 32)

            Layout.preferredWidth: button.iconSize
            Layout.preferredHeight: button.iconSize
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }
        MultiEffect {
            visible: button.iconLeft !== "" && button.foregroundColor !== Mocha.text
            source: buttonIconLeft
            Layout.preferredWidth: button.iconSize
            Layout.preferredHeight: button.iconSize

            colorization: 1.0
            colorizationColor: button.foregroundColor
        }

        Text {
            id: buttonText
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            visible: button.text != ""

            text: button.text
            color: button.foregroundColor

            font {
                family: Fonts.mainFont
                pixelSize: button.fontSize
            }
        }

        Image {
            id: buttonIconRight
            visible: button.iconRight !== "" && button.foregroundColor === Mocha.text
            source: button.iconRight ? Quickshell.iconPath(button.iconRight) : ""
            sourceSize: Qt.size(32, 32)

            Layout.preferredWidth: button.iconSize
            Layout.preferredHeight: button.iconSize
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }
        MultiEffect {
            visible: button.iconRight !== "" && button.foregroundColor !== Mocha.text
            source: buttonIconRight
            Layout.preferredWidth: button.iconSize
            Layout.preferredHeight: button.iconSize

            colorization: 1.0
            colorizationColor: button.foregroundColor
        }
    }

    TapHandler {
        acceptedButtons: Qt.LeftButton
        onTapped: {
            button.leftClick();
        }
    }

    TapHandler {
        acceptedButtons: Qt.RightButton
        onTapped: {
            button.rightClick();
        }
    }

    HoverHandler {
        id: buttonHover
        cursorShape: button.cursorShape
        onHoveredChanged: {
            if (button.active) {
                return;
            }
            button.color = hovered ? Mocha.surface2 : button.backgroundColor;
        }
    }

    PopupWindow {
        id: buttonPopup
        visible: button.tooltip !== "" && buttonHover.hovered

        anchor {
            item: button
            edges: Edges.Bottom
            gravity: Edges.Bottom
            margins.bottom: -16
        }

        color: "transparent"

        implicitWidth: buttonPopupContent.width
        implicitHeight: buttonPopupContent.height

        WrapperRectangle {
            color: Mocha.base
            radius: 4

            ColumnLayout {
                id: buttonPopupContent
                spacing: 8

                Text {
                    Layout.fillWidth: true
                    Layout.preferredHeight: implicitHeight
                    Layout.margins: 8

                    text: button.tooltip
                    color: Mocha.text

                    font {
                        family: Fonts.mainFont
                        pixelSize: Fonts.mainFontSize
                    }
                }
            }
        }
    }
}
