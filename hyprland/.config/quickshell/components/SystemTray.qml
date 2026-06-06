// qmllint disable unqualified
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray

Row {
    id: systemTray

    spacing: 12

    Layout.fillHeight: true

    Repeater {
        model: SystemTray.items

        IconImage {
            id: trayIcon
            property int size: 22

            source: modelData.icon
            width: size
            height: size

            anchors {
                verticalCenter: parent.verticalCenter
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
}
