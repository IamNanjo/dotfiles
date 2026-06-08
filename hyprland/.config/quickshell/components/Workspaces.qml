// qmllint disable unqualified
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import "../themes"
import "../styles"

Row {
    Layout.fillHeight: true

    Repeater {
        model: Hyprland.workspaces.values.filter(w => w.monitor != null && w.monitor.name == toplevel.screen.name)

        Rectangle {
            property bool isActive: Hyprland.focusedWorkspace?.id === modelData.id

            color: isActive ? Mocha.crust : "transparent"
            radius: 4

            width: workspaceId.implicitWidth + 24
            height: parent.height

            Text {
                id: workspaceId
                anchors.centerIn: parent
                property var ws: Hyprland.workspaces.values.find(w => w.id === modelData.id)
                text: modelData.id
                color: isActive ? Mocha.red : Mocha.text
                font {
                    family: Fonts.mainFont
                    pixelSize: Fonts.mainFontSize
                    bold: isActive
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: Hyprland.dispatch("hl.dsp.focus({ workspace = %1 })".arg(modelData.id))
            }
        }
    }
}
