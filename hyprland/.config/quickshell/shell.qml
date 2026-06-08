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
                Row {
                    anchors {
                        left: parent.left
                        verticalCenter: parent.verticalCenter
                        leftMargin: 16
                    }

                    height: parent.height
                    spacing: 16

                    Components.Workspaces {
                        anchors {
                            verticalCenter: parent.verticalCenter
                        }
                    }
                }

                // Center
                Row {
                    anchors {
                        centerIn: parent
                    }

                    height: parent.height
                    spacing: 16

                    Components.WindowTitle {
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }

                // Right
                Row {
                    anchors {
                        right: parent.right
                        verticalCenter: parent.verticalCenter
                        rightMargin: 16
                    }

                    Layout.alignment: Qt.AlignCenter | Qt.AlignRight

                    height: parent.height

                    Components.SystemTray {}

                    Components.Audio {}

                    Components.Battery {
                        anchors {
                            verticalCenter: parent.verticalCenter
                        }
                    }

                    Components.Time {
                        anchors {
                            verticalCenter: parent.verticalCenter
                        }
                    }

                    Components.Notifications {
                        anchors {
                            verticalCenter: parent.verticalCenter
                        }
                    }
                }
            }
        }
    }
}
