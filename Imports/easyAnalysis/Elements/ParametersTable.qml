import QtQuick 2.12
import QtQuick.Controls 1.4
//import QtQuick.Controls 2.12 as Controls2
import QtQuick.Layouts 1.12
import easyAnalysis 1.0 as Generic

TableView {
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

            // Vertical spacer
            Item { width: Generic.Style.tableColumnSpacing/2 }

            // Content
            Text {
                Layout.fillWidth: true
                horizontalAlignment: styleData.textAlignment
                font.pointSize: Generic.Style.tableFontPointSize
                text: styleData.value
            }

            // Vertical spacer
            Item { width: Generic.Style.tableColumnSpacing/2 }

            // Vertical border
            Rectangle {
                Layout.fillHeight: true
                width: Generic.Style.appBorderThickness
                ///color: styleData.selected ? Generic.Style.tableHighlightTextColor : Generic.Style.appBorderColor
                color: Generic.Style.appBorderColor
            }
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

            // Vertical spacer
            Item { width: Generic.Style.tableColumnSpacing/2 }

            // Content
            TextEdit {
                Layout.fillWidth: true
                font.pointSize: Generic.Style.tableFontPointSize
                color: selectable && styleData.selected ? Generic.Style.tableHighlightTextColor : Generic.Style.tableTextColor
                text: styleData.value
            }

            // Vertical spacer
            Item { width: Generic.Style.tableColumnSpacing/2 }

            // Vertical border
            Rectangle {
                Layout.fillHeight: true
                width: Generic.Style.appBorderThickness
                color: selectable && styleData.selected ? Generic.Style.tableHighlightBorderColor : Generic.Style.tableHeaderRowColor
                //color: Generic.Style.tableColumnBorderColor
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
