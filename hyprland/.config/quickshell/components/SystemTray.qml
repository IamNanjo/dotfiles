// qmllint disable unqualified
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.SystemTray
import "../themes"

RowLayout {
    id: systemTray

    height: parent.height

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
                    edges: Edges.Bottom | Edges.Left

                    margins {
                        bottom: -8
                    }
                }
            }

            WheelHandler {
                onWheel: e => {
                    modelData.scroll(e.rotation / 120, false);
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

    // Spacing between last tray item and next module
    Item {}
}
