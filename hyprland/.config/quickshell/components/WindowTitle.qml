// qmllint disable unqualified
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Widgets
import "../styles"
import "../themes"

Text {
    id: windowTitle
    text: Hyprland.activeToplevel ? Hyprland.activeToplevel.title : ""
    color: "#f38ba8"
    elide: Text.ElideRight
    wrapMode: Text.NoWrap

    Layout.fillWidth: true
    Layout.fillHeight: true

    verticalAlignment: Text.AlignVCenter

    font {
        family: Fonts.mainFont
        pixelSize: Fonts.mainFontSize
    }

    HoverHandler {
        id: windowTitleHover
    }

    PopupWindow {
        id: windowTitlePopup
        visible: windowTitleHover.hovered

        anchor {
            item: windowTitle
            edges: Edges.Bottom
            gravity: Edges.Bottom
            margins.bottom: -16
        }

        color: "transparent"

        implicitWidth: windowTitlePopupContainer.implicitWidth
        implicitHeight: windowTitlePopupContainer.implicitHeight

        Rectangle {
            id: windowTitlePopupContainer

            color: Mocha.base
            radius: 4

            implicitWidth: windowTitlePopupText.implicitWidth + 16
            implicitHeight: windowTitlePopupText.implicitHeight + 16

            Text {
                id: windowTitlePopupText
                anchors {
                    centerIn: parent
                }

                text: windowTitle.text
                color: Mocha.text

                font {
                    family: Fonts.mainFont
                    pixelSize: Fonts.mainFontSize
                }
            }
        }
    }
}
