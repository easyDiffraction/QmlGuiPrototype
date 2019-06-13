import QtQuick 2.12
import QtQuick.Controls 1.4 as Controls1
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import easyAnalysis 1.0 as Generic
import QtQuick.Controls.impl 2.12
import easyAnalysis.App.Elements 1.0 as GenericAppElements
import easyAnalysis.App.ContentArea 1.0 as GenericAppContentArea

import QtGraphicalEffects 1.12


Controls1.TableView {
    property bool customFrameVisible: true
    property bool selectable: false
    property int selectedRow: 0
    property int visibleRowsCount: Math.min(model.count, Generic.Style.maxVisibleRowsCount)

    id: tableView
    clip: true
    Layout.fillWidth: true
    implicitHeight: (visibleRowsCount + 1) * Generic.Style.tableRowHeight + Generic.Style.appBorderThickness // add 1 row for header

    // Custom frame
    frameVisible: false
    Rectangle {
        anchors.fill: parent
        color: "transparent"
        border.color: Generic.Style.appBorderColor
        border.width: customFrameVisible ? 1 : 0
    }

    // Header
    headerDelegate: Rectangle {
        implicitWidth: headerLayout.implicitWidth
        height: Generic.Style.tableRowHeight
        color: Generic.Style.tableHeaderRowColor

        RowLayout {
            id: headerLayout
            anchors.fill: parent
            spacing: 0

            // Vertical border
            Rectangle {
                Layout.fillHeight: true
                width: Generic.Style.appBorderThickness
                ///color: styleData.selected ? Generic.Style.tableHighlightTextColor : Generic.Style.appBorderColor
                color: Generic.Style.appBorderColor
            }

            // Vertical spacer
            Item { width: Generic.Style.tableColumnSpacing/2 }

            // Icon
            Image {
                id: headerCellIcon
                antialiasing: true
                Layout.alignment: Qt.AlignCenter
                Layout.fillWidth: true
                fillMode: Image.PreserveAspectFit
                sourceSize: Qt.size( 20, 20 )
                //source: styleData.role === "del" ? "../Icons/TrashCan.svg" : ""
                //Component.onCompleted: console.log("A", styleData.role, styleData.value)
                source: iconSelector()
                function iconSelector() {
                    ///console.log("A", styleData.role, styleData.value)
                    if (styleData.value === "Remove") return Generic.Variables.iconsPath + "TrashCan.svg"
                    return ""
                }
                ColorOverlay {
                    source: headerCellIcon
                    anchors.fill: headerCellIcon
                    color: Generic.Style.buttonIconEnabledColor
                }
            }

            // Content
            Text {
                Layout.fillWidth: true
                horizontalAlignment: styleData.textAlignment
                font.pointSize: Generic.Style.tableFontPointSize
                text: textSelector()
                function textSelector() {
                    if (styleData.value === "Remove") return ""
                    return styleData.value
                }
            }

            // Vertical spacer
            Item { width: Generic.Style.tableColumnSpacing/2 }


        }
    }

    // Row
    rowDelegate: Rectangle {
        height: Generic.Style.tableRowHeight
        Layout.fillHeight: true
        color: {
            if (selectable && styleData.selected)
                return Generic.Style.tableHighlightRowColor
            return styleData.alternate ? Generic.Style.tableAlternateRowColor : Generic.Style.tableRowColor
        }
    }

    // Cell
    itemDelegate: Rectangle {
        implicitWidth: cellLayout.implicitWidth
        color: "transparent"

        RowLayout {
            id: cellLayout
            anchors.fill: parent
            spacing: 0

            // Vertical border
            Rectangle {
                Layout.fillHeight: true
                width: Generic.Style.appBorderThickness
                color: selectable && styleData.selected ? Generic.Style.tableHighlightBorderColor : Generic.Style.tableHeaderRowColor
                //color: Generic.Style.tableColumnBorderColor
            }

            // Vertical spacer
            Item {
                id: leftSpacer;
                width: Generic.Style.tableColumnSpacing/2
                visible: !(styleData.role === "remove") && !(styleData.role === "color")
            }


            // Icon
            Image {
                id: icon
                visible: (styleData.value === "sample") || (styleData.value === "instrument")
                antialiasing: true
                Layout.alignment: Qt.AlignCenter
                Layout.fillWidth: true
                fillMode: Image.PreserveAspectFit
                sourceSize: Qt.size( 20, 20 )
                source: iconSelector()
                function iconSelector() {
                    ///console.log("B", styleData.role, styleData.value)
                    if (styleData.value === "sample") return Generic.Variables.iconsPath + "Diamond.svg"
                    if (styleData.value === "instrument") return Generic.Variables.iconsPath + "Microscope.svg"
                    return ""
                }
                ColorOverlay {
                    source: icon
                    anchors.fill: icon
                    color: selectable && styleData.selected ? Generic.Style.buttonIconHighlightedColor : Generic.Style.buttonIconEnabledColor
                }
            }

            // TextEdit
            TextEdit {
                Layout.fillWidth: true
                font.pointSize: Generic.Style.tableFontPointSize
                visible: !(styleData.role === "remove") && !(styleData.role === "color")
                enabled: styleData.role === "num" || styleData.value[0] === "&" ? false : true
                color: textColor()
                text: textSelector()
                function textSelector() {
                    //console.log("C", styleData.role, styleData.value, styleData.value[1])
                    if (styleData.value === "sample") return ""
                    if (styleData.value === "instrument") return ""
                    if (styleData.value[0] === "&" && styleData.role === "jobName") return styleData.value.substr(1)
                    if (styleData.role === "fit") return ""
                    if (styleData.role === "color") return ""
                    if (styleData.role === "min" && !styleData.value) return "-\u221E"
                    if (styleData.role === "max" && !styleData.value) return "+\u221E"
                    return styleData.value
                }
                function textColor() {
                    if (!enabled  && styleData.role === "jobName")
                        return Generic.Style.tableDisabledTextColor
                    return selectable && styleData.selected ? Generic.Style.tableHighlightTextColor : Generic.Style.tableTextColor
                }
            }

            // Remove-button
            GenericAppContentArea.Button {
                id: button
                visible: styleData.role === "remove" ? true : false
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Remove this row from the table" + styleData.role + styleData.value)
                Layout.fillHeight: true
                Layout.fillWidth: true
                padding: 2
                leftPadding: 3
                rightPadding: 4
                background: Rectangle {
                    anchors.fill: parent
                    anchors.margins: button.padding
                    anchors.leftMargin: button.leftPadding
                    anchors.rightMargin: button.rightPadding
                    radius: Generic.Style.toolbarButtonRadius
                    border.color: button.highlighted ? Generic.Style.buttonBkgHighlightedColor : Generic.Style.appBorderColor
                    color: backgroundColor()
                    function backgroundColor() {
                        if (!button.enabled)
                            return Generic.Style.buttonBkgDisabledColor
                        var color1 = button.highlighted ? Generic.Style.buttonBkgHighlightedColor : Generic.Style.buttonBkgEnabledColor
                        var color2 = Generic.Style.buttonBkgBlendColor
                        var alpha = button.down ? Generic.Style.buttonBkgBlendAlpha : 0.0
                        return Color.blend(color1, color2, alpha)
                    }
                }
                icon.source: iconSelector()
                function iconSelector() {
                    if (styleData.role === "remove") return Generic.Variables.iconsPath + "Minus.svg"
                    return ""
                }
            }

            // Color-box
            Button {
                id: colorBox
                visible: styleData.role === "color" ? true : false
                Layout.fillHeight: true
                Layout.fillWidth: true
                contentItem: IconLabel {                }
                background: Rectangle {
                    anchors.fill: parent
                    anchors.margins: 2
                    anchors.rightMargin: 3
                    anchors.leftMargin: anchors.rightMargin
                    color: styleData.role === "color" ? styleData.value : "transparent"
                }
            }

            // CheckBox
            CheckBox {
                Layout.fillWidth: true
                Layout.fillHeight: true
                visible: styleData.role === "fit"
                checked: styleData.value
            }

            // Vertical spacer
            Item {
                id: rightSpacer
                width: Generic.Style.tableColumnSpacing/2
                visible: !(styleData.role === "remove") && !(styleData.role === "color")
            }


        }
    }

    // Adjust columns widths
    Component.onCompleted: {
        // First, resize with default Qt function
        resizeColumnsToContents()

        // sum column widths and number of resizable columns
        let sumColumnsWidth = 0
        let resizableColumnsCount = 0
        for (let i = 0; i < columnCount; i++){
            sumColumnsWidth += getColumn(i).width
            if (getColumn(i).resizable) {
                resizableColumnsCount += 1
            }
        }

        // increase columns width
        const extenderWidth = Math.round((tableView.width - sumColumnsWidth) / resizableColumnsCount)
        for (let i = 0; i < columnCount; i++){
            if (getColumn(i).resizable) {
                getColumn(i).width += extenderWidth
            }
        }

        // adjust last column width
        const rest = tableView.width - sumColumnsWidth - extenderWidth*resizableColumnsCount
        getColumn(columnCount-1).width += rest

        // select 1st row, if table is selectable
        if (selectable)
            tableView.selection.select(selectedRow)
    }

}
