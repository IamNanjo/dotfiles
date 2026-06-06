// qmllint disable unqualified
import QtQuick
import QtQuick.Layouts
import "../styles"
import "../themes"
import "." as Components

Rectangle {
    id: calendar
    color: Mocha.base
    radius: 4

    anchors.fill: parent

    required property bool isVisible
    property date currentDate: new Date()
    property date selectedDate: new Date(0)

    onIsVisibleChanged: {
        selectedDate = new Date(0);
        currentDate = new Date();
    }

    ColumnLayout {
        anchors {
            fill: parent
            topMargin: 12
            leftMargin: 24
            rightMargin: 24
            bottomMargin: 12
        }

        spacing: 16

        Item {
            implicitWidth: parent.width
            implicitHeight: 34

            Row {
                anchors {
                    top: parent.top
                    centerIn: parent
                }

                spacing: 24

                Components.Button {
                    iconLeft: "go-previous-symbolic"
                    iconSize: 24
                    onLeftClick: {
                        calendar.currentDate.setFullYear(calendar.currentDate.getFullYear() - 1);
                    }
                }

                Text {
                    anchors.verticalCenter: parent.verticalCenter

                    text: calendar.currentDate.getFullYear()
                    color: Mocha.text
                    width: 90
                    horizontalAlignment: Qt.AlignHCenter

                    font {
                        family: Fonts.mainFont
                        pixelSize: 18
                        bold: true
                    }
                }

                Components.Button {
                    iconLeft: "go-next-symbolic"
                    iconSize: 24
                    onLeftClick: {
                        calendar.currentDate.setFullYear(calendar.currentDate.getFullYear() + 1);
                    }
                }
            }
        }

        Item {
            implicitWidth: parent.width
            implicitHeight: 34

            Row {
                anchors {
                    top: parent.top
                    centerIn: parent
                }

                spacing: 24

                Components.Button {
                    iconLeft: "go-previous-symbolic"
                    iconSize: 24
                    onLeftClick: {
                        calendar.currentDate.setMonth(calendar.currentDate.getMonth() - 1);
                    }
                }

                Text {
                    anchors.verticalCenter: parent.verticalCenter

                    text: Qt.formatDate(calendar.currentDate, "MMMM")
                    color: Mocha.text
                    width: 90
                    horizontalAlignment: Qt.AlignHCenter

                    font {
                        family: Fonts.mainFont
                        pixelSize: 18
                        bold: true
                    }
                }

                Components.Button {
                    iconLeft: "go-next-symbolic"
                    iconSize: 24
                    onLeftClick: {
                        calendar.currentDate.setMonth(calendar.currentDate.getMonth() + 1);
                    }
                }
            }

            Components.Button {
                anchors {
                    right: parent.right
                    rightMargin: 8
                }

                text: "Today"
                onLeftClick: () => {
                    calendar.selectedDate = new Date(0);
                    calendar.currentDate = new Date();
                }
            }
        }

        Rectangle {
            color: "transparent"

            Layout.fillWidth: true
            Layout.fillHeight: true

            radius: 4

            GridLayout {
                id: calendarGrid

                // Stretch to fill parent container
                anchors {
                    fill: parent
                }

                // 8 columns: 1 for Week Number + 7 for Days
                columns: 8
                rows: 7
                rowSpacing: 4
                columnSpacing: 4

                // Flat array to hold 48 items (6 rows of 8 columns)
                property var cellsModel: []

                function updateCalendar() {
                    let d = calendar.currentDate;
                    let year = d.getFullYear();
                    let month = d.getMonth();

                    // 0 = Sunday, 1 = Monday. Convert to 0 = Monday, 6 = Sunday.
                    let firstDayJS = new Date(year, month, 1).getDay();
                    let firstDayGrid = (firstDayJS + 6) % 7;

                    let newModel = [];

                    // Helper function: Calculate ISO-8601 Week Number
                    function getISOWeek(dateObj) {
                        let tempDate = new Date(dateObj.getTime());
                        tempDate.setHours(0, 0, 0, 0);
                        tempDate.setDate(tempDate.getDate() + 3 - (tempDate.getDay() + 6) % 7);
                        let week1 = new Date(tempDate.getFullYear(), 0, 4);
                        return 1 + Math.round(((tempDate.getTime() - week1.getTime()) / 86400000 - 3 + (week1.getDay() + 6) % 7) / 7);
                    }

                    const today = new Date();

                    // Generate 6 rows
                    for (let week = 0; week < 6; week++) {
                        // Find the exact date of Monday for the current row
                        let mondayDate = new Date(year, month, 1 - firstDayGrid + (week * 7));

                        // 1st Column: Week Number (Transparent)
                        newModel.push({
                            type: "weekNumber",
                            text: getISOWeek(mondayDate).toString(),
                            isCurrentMonth: false
                        });

                        // Columns 2-8: The 7 Days of the Week
                        for (let day = 0; day < 7; day++) {
                            let cellDate = new Date(year, month, 1 - firstDayGrid + (week * 7) + day);
                            let isToday = cellDate.getDate() === today.getDate() && cellDate.getMonth() === today.getMonth() && cellDate.getFullYear() === today.getFullYear();
                            newModel.push({
                                type: "day",
                                cellDate: cellDate,
                                text: cellDate.getDate().toString(),
                                isCurrentMonth: cellDate.getMonth() === month,
                                isToday: isToday,
                                isSelected: calendar.selectedDate.getTime() === cellDate.getTime()
                            });
                        }
                    }

                    cellsModel = newModel;
                }

                Component.onCompleted: updateCalendar()

                Connections {
                    target: calendar
                    function onCurrentDateChanged() {
                        calendarGrid.updateCalendar();
                    }
                }

                // --- ROW 0: The Header ---
                // Blank corner cell, followed by Monday -> Sunday initials
                Repeater {
                    model: ["", "M", "T", "W", "T", "F", "S", "S"]
                    Item {
                        Layout.fillWidth: true
                        Layout.fillHeight: true

                        Text {
                            anchors.centerIn: parent
                            text: modelData
                            color: Mocha.text
                            font.family: Fonts.mainFont
                            font.pixelSize: Fonts.mainFontSize
                            opacity: 0.8
                        }
                    }
                }

                // --- ROWS 1 to 6: Week Numbers & Days ---
                Repeater {
                    model: calendarGrid.cellsModel

                    Item {
                        Layout.fillWidth: true
                        Layout.fillHeight: true

                        Text {
                            visible: modelData.type === "weekNumber"
                            anchors.centerIn: parent
                            text: modelData.text
                            color: Mocha.text
                            opacity: 0.8

                            font {
                                family: Fonts.mainFont
                                pixelSize: Fonts.mainFontSize
                            }
                        }

                        Components.Button {
                            visible: modelData.type === "day"
                            anchors.fill: parent

                            text: modelData.text
                            backgroundColor: modelData.isToday ? Mocha.surface0 : Mocha.crust
                            active: modelData.isSelected === true

                            opacity: modelData.isCurrentMonth ? 1 : 0.5

                            onLeftClick: {
                                calendar.selectedDate = modelData.cellDate;
                                calendar.currentDate = modelData.cellDate;
                            }
                        }
                    }
                }
            }
        }
    }
}
