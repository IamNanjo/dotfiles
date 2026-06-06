// qmllint disable unqualified
import QtQuick
import Quickshell.Hyprland
import "../styles"

Text {
    text: Hyprland.activeToplevel ? Hyprland.activeToplevel.title : ""
    color: "#f38ba8"

    font {
        family: Fonts.mainFont
        pixelSize: Fonts.mainFontSize
    }
}
