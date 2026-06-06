// qmllint disable unqualified
//@ pragma UseQApplication
import Quickshell
import QtQuick
import "components" as Components

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

                height: parent.height
                spacing: 16

                Components.SystemTray {
                    anchors {
                        verticalCenter: parent.verticalCenter
                        margins: 0
                        rightMargin: 24
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
