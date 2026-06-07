import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.UPower
import "../styles"
import "../themes"

RowLayout {
    id: battery
    visible: device.isPresent && device.ready

    height: parent.height
    spacing: 6

    // Access the primary system battery
    readonly property UPowerDevice device: UPower.displayDevice
    readonly property int capacity: device ? Math.round(device.percentage) : 0

    Image {
        id: batteryIcon
        source: Quickshell.iconPath(battery.device.iconName)
        property int size: 32
        sourceSize: Qt.size(size, size)
        Layout.preferredHeight: 24
        Layout.preferredWidth: height
        Layout.alignment: Qt.AlignVCenter
    }

    HoverHandler {
        id: batteryHover
    }

    PopupWindow {
        id: batteryPopup

        anchor {
            item: batteryIcon
            edges: Edges.Bottom | Edges.Right
            gravity: Edges.Bottom | Edges.Left
            margins.bottom: -8
        }

        visible: batteryHover.hovered
        color: "transparent"

        implicitWidth: batteryPopupContent.width
        implicitHeight: batteryPopupContent.height

        WrapperRectangle {
            color: Mocha.base
            radius: 4

            ColumnLayout {
                id: batteryPopupContent
                spacing: 8

                Text {
                    Layout.fillWidth: true
                    Layout.preferredHeight: implicitHeight
                    Layout.margins: 8

                    text: battery.device.timeToFull != 0 ? `Time to full: ${formatTime(battery.device.timeToFull)}` : `Time to empty: ${formatTime(battery.device.timeToEmpty)}`
                    color: Mocha.text

                    function formatTime(seconds) {
                        const hours = Math.floor(seconds / 3600);
                        const minutes = Math.floor((seconds % 3600) / 60);

                        let parts = [];
                        if (hours > 0)
                            parts.push(`${hours}h`);
                        if (minutes > 0)
                            parts.push(`${minutes}m`);

                        return parts.length > 0 ? parts.join(" ") : "< 1m";
                    }

                    font {
                        family: Fonts.mainFont
                        pixelSize: Fonts.mainFontSize
                    }
                }
            }
        }
    }
}
