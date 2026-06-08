// qmllint disable unqualified
import QtQuick
import Quickshell
import "../themes"
import "." as Components

Components.Button {
    id: timeText
    text: Qt.formatDateTime(clock.date, "dddd dd.MM.yyyy HH:mm")
    backgroundColor: "transparent"
    foregroundColor: Mocha.mauve

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

    TapHandler {
        onTapped: {
            calendarPopup.visible = !calendarPopup.visible;
        }
    }

    PopupWindow {
        id: calendarPopup
        visible: false

        anchor {
            item: timeText
            edges: Edges.Bottom | Edges.Right
            gravity: Edges.Bottom | Edges.Left
            margins.bottom: -16
        }

        grabFocus: true
        color: "transparent"

        implicitWidth: 500
        implicitHeight: 460

        Components.Calendar {
            anchors {
                fill: parent
            }

            isVisible: visible
        }
    }
}
