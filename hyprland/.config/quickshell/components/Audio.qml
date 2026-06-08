// qmllint disable unqualified
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets
import "../styles"
import "../themes"
import "." as Components

RowLayout {
    id: audio
    visible: Pipewire.ready

    height: parent.height

    // Output
    Components.Button {
        id: audioOutput

        property PwNode node: Pipewire.defaultAudioSink

        PwObjectTracker {
            objects: audioOutput.node ? [audioOutput.node] : []
        }

        text: audioOutput.node?.audio ? `${Math.round(audioOutput.node.audio.volume * 100)}%` : "N/A"
        iconRight: "audio-speakers-symbolic"
        backgroundColor: "transparent"
        foregroundColor: Mocha.green

        Layout.fillHeight: true

        onLeftClick: {
            if (!audioOutputPopup.visible) {
                audioOutputPopup.visible = true;
                audioInputPopup.visible = false;
            } else {
                audioOutputPopup.visible = false;
            }
        }

        onRightClick: {
            Quickshell.execDetached(["pavucontrol", "-t", "3"]);
        }

        Components.AudioVolumeScroller {
            node: audioOutput.node
        }
    }

    // Input
    Components.Button {
        id: audioInput

        property PwNode node: Pipewire.defaultAudioSource

        PwObjectTracker {
            objects: audioInput.node ? [audioInput.node] : []
        }

        text: audioInput.node?.audio ? `${Math.round(audioInput.node.audio.volume * 100)}%` : "N/A"
        iconRight: "microphone-symbolic"
        backgroundColor: "transparent"
        foregroundColor: Mocha.maroon

        Layout.fillHeight: true

        onLeftClick: {
            if (!audioInputPopup.visible) {
                audioInputPopup.visible = true;
                audioOutputPopup.visible = false;
            } else {
                audioInputPopup.visible = false;
            }
        }

        onRightClick: {
            Quickshell.execDetached(["pavucontrol", "-t", "4"]);
        }

        Components.AudioVolumeScroller {
            node: audioInput.node
        }
    }

    // Output popup
    PopupWindow {
        id: audioOutputPopup

        anchor {
            item: audioOutput
            edges: Edges.Bottom | Edges.Right
            gravity: Edges.Bottom | Edges.Left
            margins.bottom: -8
        }

        color: "transparent"

        implicitWidth: audioOutputPopupContent.implicitWidth
        implicitHeight: audioOutputPopupContent.implicitHeight

        Rectangle {
            id: audioOutputPopupContent

            color: Mocha.base
            radius: 4

            implicitWidth: audioOutputList.implicitWidth + 16
            implicitHeight: audioOutputList.implicitHeight + 16

            ColumnLayout {
                id: audioOutputList
                spacing: 16

                anchors.centerIn: parent

                Repeater {
                    model: Pipewire.nodes.values.filter(n => {
                        return n.name.startsWith("virtual_sink_") || (n.ready && n.properties?.["media.class"] === "Audio/Sink");
                    }).sort((a, b) => {
                        const priorityOrder = ["virtual_sink_master", "virtual_sink_primary", "virtual_sink_chat", "virtual_sink_media"];

                        let indexA = priorityOrder.indexOf(a.objectName);
                        let indexB = priorityOrder.indexOf(b.objectName);

                        if (indexA !== -1 && indexB !== -1) {
                            return indexA - indexB;
                        } else if (indexA !== -1) {
                            return -1;
                        } else if (indexB !== -1) {
                            return 1;
                        } else {
                            return a.objectName.localeCompare(b.objectName);
                        }
                    })

                    ColumnLayout {
                        Layout.fillWidth: true
                        Layout.minimumWidth: 480
                        Layout.margins: 16

                        RowLayout {
                            Layout.fillWidth: true
                            Layout.leftMargin: 8
                            Layout.rightMargin: 8

                            Text {
                                text: modelData.description
                                color: Mocha.text

                                font {
                                    family: Fonts.mainFont
                                    pixelSize: Fonts.mainFontSize
                                }

                                Layout.fillWidth: true
                            }

                            Text {
                                text: `${Math.round(volumeSlider.value * 100)}%`
                                color: Mocha.text

                                font {
                                    family: Fonts.mainFont
                                    pixelSize: Fonts.mainFontSize
                                }

                                Layout.alignment: Qt.AlignRight
                            }
                        }

                        Slider {
                            id: volumeSlider
                            from: 0
                            to: 1
                            stepSize: 0.05
                            value: modelData?.audio?.volume
                            snapMode: Slider.SnapAlways

                            Layout.fillWidth: true

                            onValueChanged: {
                                if (!modelData?.audio?.volume) {
                                    return;
                                }
                                modelData.audio.volume = value;
                            }
                        }
                    }
                }
            }
        }
    }

    // Input popup
    PopupWindow {
        id: audioInputPopup

        anchor {
            item: audioInput
            edges: Edges.Bottom | Edges.Right
            gravity: Edges.Bottom | Edges.Left
            margins.bottom: -8
        }

        color: "transparent"

        implicitWidth: audioInputPopupContent.implicitWidth
        implicitHeight: audioInputPopupContent.implicitHeight

        Rectangle {
            id: audioInputPopupContent

            color: Mocha.base
            radius: 4

            implicitWidth: audioInputList.implicitWidth + 16
            implicitHeight: audioInputList.implicitHeight + 16

            ColumnLayout {
                id: audioInputList
                spacing: 16

                anchors.centerIn: parent

                Repeater {
                    model: Pipewire.nodes.values.filter(n => {
                        if (!n.ready)
                            return false;
                        return n.properties?.["media.class"] === "Audio/Source";
                    })

                    ColumnLayout {
                        Layout.fillWidth: true
                        Layout.minimumWidth: 480
                        Layout.margins: 16

                        RowLayout {
                            Layout.fillWidth: true
                            Layout.leftMargin: 8
                            Layout.rightMargin: 8

                            Text {
                                text: modelData.description
                                color: Mocha.text

                                font {
                                    family: Fonts.mainFont
                                    pixelSize: Fonts.mainFontSize
                                }

                                Layout.fillWidth: true
                            }

                            Text {
                                text: `${Math.round(volumeSlider.value * 100)}%`
                                color: Mocha.text

                                font {
                                    family: Fonts.mainFont
                                    pixelSize: Fonts.mainFontSize
                                }

                                Layout.alignment: Qt.AlignRight
                            }
                        }

                        Slider {
                            id: volumeSlider
                            from: 0
                            to: 1
                            stepSize: 0.05
                            value: modelData?.audio?.volume
                            snapMode: Slider.SnapAlways

                            Layout.fillWidth: true

                            onValueChanged: {
                                if (!modelData?.audio?.volume) {
                                    return;
                                }
                                modelData.audio.volume = value;
                            }
                        }
                    }
                }
            }
        }
    }
}
