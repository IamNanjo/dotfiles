// qmllint disable unqualified
import QtQuick
import Quickshell.Services.Pipewire

WheelHandler {
    required property PwNode node
    property double lastScrollTime: 0
    property double scrollCooldown: 100
    property double max: 1
    acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
    onWheel: e => {
        if (!node?.audio) {
            return;
        }

        const now = Date.now();
        if (now - lastScrollTime < scrollCooldown) {
            return;
        }
        lastScrollTime = now;

        const change = e.angleDelta.y;
        let newVolume;
        if (change > 0) {
            newVolume = node.audio.volume + 0.05;
        } else if (change < 0) {
            newVolume = node.audio.volume - 0.05;
        } else {
            return;
        }

        node.audio.volume = Math.max(0.0, Math.min(max, newVolume));
    }
}
