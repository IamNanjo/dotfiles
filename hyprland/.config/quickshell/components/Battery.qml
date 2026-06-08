// qmllint disable unqualified
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.UPower
import "../styles"
import "../themes"

RowLayout {
    id: battery
    visible: device.isPresent && device.ready

    Layout.fillHeight: true
    Layout.preferredWidth: batteryIcon.width
    spacing: 6

    // Access the primary system battery
    readonly property UPowerDevice device: UPower.displayDevice
    readonly property int percentage: device ? Math.round(device.percentage * 100) : 0

    Image {
        id: batteryIcon
        source: Quickshell.iconPath(battery.device.iconName)
        sourceSize: Qt.size(32, 32)

        Layout.preferredHeight: 26
        Layout.preferredWidth: height
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

        transform: Rotation {
            origin.x: batteryIcon.width / 2
            origin.y: batteryIcon.height / 2
            angle: 90
        }
    }

    HoverHandler {
        id: batteryHover
    }

    PopupWindow {
        id: batteryPopup

        anchor {
            item: battery
            edges: Edges.Bottom
            gravity: Edges.Bottom
            margins.bottom: -16
        }

        visible: batteryHover.hovered
        color: "transparent"

        implicitWidth: batteryPopupContainer.implicitWidth
        implicitHeight: batteryPopupContainer.implicitHeight

        Rectangle {
            id: batteryPopupContainer

            color: Mocha.base
            radius: 4

            implicitWidth: batteryPopupContent.implicitWidth + 24
            implicitHeight: batteryPopupContent.implicitHeight + 24

            ColumnLayout {
                id: batteryPopupContent

                spacing: 0
                anchors.centerIn: parent

                Text {
                    text: `Battery level: ${battery.percentage}%`
                    color: Mocha.text

                    Layout.fillWidth: true
                    Layout.preferredHeight: implicitHeight

                    font {
                        family: Fonts.mainFont
                        pixelSize: Fonts.mainFontSize
                    }
                }
                Text {
                    visible: battery.device.timeToFull !== 0 || battery.device.timeToEmpty !== 0
                    text: battery.device.timeToFull != 0 ? `Full in ${formatTime(battery.device.timeToFull)}` : `Empty in ${formatTime(battery.device.timeToEmpty)}`
                    color: Mocha.text

                    Layout.fillWidth: true
                    Layout.preferredHeight: implicitHeight

                    function formatTime(seconds) {
                        const hours = Math.floor(seconds / 3600);
                        const minutes = Math.floor((seconds % 3600) / 60);

                        let parts = [];
                        if (hours > 0)
                            parts.push(`${hours} hour${hours === 1 ? "" : "s"}`);
                        if (minutes > 0)
                            parts.push(`${minutes} minute${minutes === 1 ? "" : "s"}`);

                        return parts.length > 0 ? parts.join(" ") : "under 1 minute";
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
