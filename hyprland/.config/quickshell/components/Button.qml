// qmllint disable unqualified
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import "../styles"
import "../themes"

WrapperRectangle {
    id: button

    property string text
    property string iconLeft
    property string iconRight
    property int iconSize: 22
    property int fontSize: Fonts.mainFontSize
    property color backgroundColor: Mocha.crust
    property color foregroundColor: Mocha.text
    property bool active: false
    property var cursorShape: Qt.PointingHandCursor

    signal leftClick
    signal rightClick

    color: active ? Mocha.red : backgroundColor
    rightMargin: 16
    leftMargin: 16
    radius: 4

    implicitWidth: buttonContent.implicitWidth + leftMargin + rightMargin
    implicitHeight: Math.max(36, buttonContent.implicitHeight)

    RowLayout {
        id: buttonContent
        anchors.centerIn: parent
        spacing: 8

        IconImage {
            id: buttonIconLeft
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            visible: button.iconLeft !== ""

            Layout.preferredWidth: button.iconSize
            Layout.preferredHeight: button.iconSize
            source: button.iconLeft ? Quickshell.iconPath(button.iconLeft) : ""
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

        IconImage {
            id: buttonIconRight
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            visible: button.iconRight !== ""

            Layout.preferredWidth: button.iconSize
            Layout.preferredHeight: button.iconSize
            source: button.iconRight ? Quickshell.iconPath(button.iconRight) : ""
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
        cursorShape: button.cursorShape
        onHoveredChanged: {
            if (button.active) {
                return;
            }
            button.color = hovered ? Mocha.surface2 : button.backgroundColor;
        }
    }
}
