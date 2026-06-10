// qmllint disable unqualified
//@ pragma UseQApplication
import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import "components" as Components

ShellRoot {
    id: root

    signal toggleVisibility(string screenName)

    GlobalShortcut {
        name: "toggle_panel"
        description: "Toggle visibility of QuickShell panel on current monitor"

        onPressed: {
            if (!Hyprland.focusedMonitor) {
                return;
            }
            root.toggleVisibility(Hyprland.focusedMonitor.name);
        }
    }

    Variants {
        model: Quickshell.screens
        delegate: Component {
            PanelWindow {
                id: toplevel

                required property var modelData

                screen: modelData

                anchors {
                    top: true
                    left: true
                    right: true
                }

                implicitHeight: 32
                color: "#E6000000"

                Connections {
                    target: root

                    function onToggleVisibility(screenName) {
                        if (toplevel.screen.name === screenName) {
                            toplevel.visible = !toplevel.visible;
                        }
                    }
                }

                // Left
                RowLayout {
                    anchors {
                        left: parent.left
                        verticalCenter: parent.verticalCenter
                        leftMargin: 8
                    }

                    height: parent.height
                    spacing: 16

                    Components.Workspaces {
                        Layout.fillHeight: true
                        Layout.alignment: Qt.AlignVCenter
                    }
                }

                // Center
                RowLayout {
                    anchors {
                        centerIn: parent
                    }

                    height: parent.height
                    spacing: 16

                    Components.WindowTitle {
                        Layout.fillHeight: true
                        Layout.alignment: Qt.AlignVCenter
                    }
                }

                // Right
                RowLayout {
                    anchors {
                        right: parent.right
                        verticalCenter: parent.verticalCenter
                        rightMargin: 8
                    }

                    spacing: 8

                    Layout.alignment: Qt.AlignCenter | Qt.AlignRight

                    height: parent.height

                    Components.SystemTray {
                        Layout.fillHeight: true
                        Layout.alignment: Qt.AlignVCenter
                    }

                    Components.Audio {
                        Layout.fillHeight: true
                        Layout.alignment: Qt.AlignVCenter
                    }

                    Components.Battery {
                        Layout.fillHeight: true
                        Layout.alignment: Qt.AlignVCenter
                    }

                    Components.Time {
                        Layout.fillHeight: true
                        Layout.alignment: Qt.AlignVCenter
                    }

                    Components.Notifications {
                        Layout.fillHeight: true
                        Layout.alignment: Qt.AlignVCenter
                    }
                }
            }
        }
    }
}
