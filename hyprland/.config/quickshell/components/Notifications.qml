// qmllint disable unqualified
import QtQuick
import Quickshell
import Quickshell.Io
import "." as Components

Components.Button {
    id: notifications
    property bool isDnd: false
    property bool hasNotifications: false
    property int notificationCount: 0

    backgroundColor: "transparent"
    iconLeft: isDnd ? "notification-disabled-new-symbolic" : (hasNotifications ? "notification-active-symbolic" : "notification-symbolic")
    tooltip: notificationCount ? `${notificationCount} notification${notificationCount === 1 ? "" : "s"}` : ""
    onLeftClick: {
        Quickshell.execDetached(["swaync-client", "-t"]);
    }

    onRightClick: {
        Quickshell.execDetached(["swaync-client", "-d"]);
    }

    Process {
        id: swayncMonitor
        command: ["swaync-client", "-swb"]
        running: true

        onRunningChanged: {
            if (!running) {
                running = true;
            }
        }

        stdout: SplitParser {
            onRead: data => {
                try {
                    let state = JSON.parse(data);

                    if (state.alt === undefined) {
                        return;
                    }

                    notifications.isDnd = state.alt.includes("dnd");
                    notifications.hasNotifications = state.alt.includes("notification");
                    notifications.notificationCount = Number(state.text);
                } catch (e) {}
            }
        }
    }
}
