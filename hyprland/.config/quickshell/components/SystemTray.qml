// qmllint disable unqualified
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.SystemTray
import "../themes"

RowLayout {
    id: systemTray

    Layout.fillHeight: true

    spacing: 8

    Repeater {
        model: SystemTray.items

        Rectangle {
            id: trayIconWrapper
            visible: modelData.icon != ""

            color: (trayIconHover.hovered || contextMenu.visible) ? Mocha.surface2 : "transparent"
            radius: 4

            Layout.preferredWidth: height
            Layout.fillHeight: true

            Image {
                id: trayIcon
                source: modelData.icon
                sourceSize: Qt.size(32, 32)

                anchors.centerIn: parent
                width: 24
                height: width
            }

            HoverHandler {
                id: trayIconHover
                cursorShape: Qt.PointingHandCursor
            }

            QsMenuAnchor {
                id: contextMenu
                menu: modelData.menu

                anchor {
                    item: trayIcon
                    edges: Edges.Bottom
                    gravity: Edges.Bottom

                    margins {
                        bottom: -16
                    }
                }
            }

            WheelHandler {
                acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
                onWheel: e => {
                    modelData.scroll(e.y / 120, false);
                }
            }

            TapHandler {
                acceptedButtons: Qt.LeftButton

                onTapped: {
                    modelData.activate();
                }
            }

            TapHandler {
                acceptedButtons: Qt.RightButton

                onTapped: {
                    if (contextMenu.visible) {
                        contextMenu.close();
                    } else {
                        contextMenu.open();
                    }
                }
            }
        }
    }
}
