import QtQuick 2.12
import QtQuick.Controls 1.4
import QtQuick.Controls 2.12 as Controls2
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.12
import easyAnalysis 1.0 as Generic

TableView {
    //property int selectRow: -1
    property bool customFrameVisible: true
    property string columnSpacing: "     "

    id: tableView
    clip: true

    // Custom frame
    frameVisible: false
    Rectangle {
        anchors.fill: parent
        color: "transparent"
        border.color: Generic.Style.tableHeaderRowColor
        border.width: customFrameVisible ? 1 : 0
    }

    // Header
    headerDelegate: Rectangle {
        implicitWidth: headerText.implicitWidth
        height: Generic.Style.tableRowHeight
        color: Generic.Style.tableHeaderRowColor
        Text {
            id: headerText
            //width: parent.width
            height: parent.height
            horizontalAlignment: styleData.textAlignment
            verticalAlignment: Text.AlignVCenter
            font.pointSize: Generic.Style.tableFontPointSize
            text: columnSpacing + styleData.value
        }
        /*
        Rectangle {
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 1
            anchors.topMargin: 1
            width: 1
            color: "red"
        }*/
    }

    // Row
    rowDelegate: Rectangle {
        height: Generic.Style.tableRowHeight
        color: {
            if (styleData.selected)
                return Generic.Style.tableHighlightRowColor
            return styleData.alternate ? Generic.Style.tableAlternateRowColor : Generic.Style.tableRowColor
        }
        //border.color: "red"
    }

    // Item
    itemDelegate: Rectangle {
        implicitWidth: itemText.implicitWidth
        color: "transparent"
        Text {
            id: itemText
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: styleData.textAlignment
            font.pointSize: Generic.Style.tableFontPointSize
            color: styleData.selected ? Generic.Style.tableHighlightTextColor : Generic.Style.tableTextColor
            text: columnSpacing + styleData.value
        }
        //border.color: "red"
    }

    // Adjust columns widths
    Component.onCompleted: resizeColumnsToContents()

    /*
    // Item
    itemDelegate: Item {
        Text {
            //width: parent.width
            height: parent.height
            horizontalAlignment: styleData.textAlignment
            verticalAlignment: Text.AlignVCenter
            font.pointSize: Generic.Style.tableFontPointSize
            color: styleData.selected ? Generic.Style.tableHighlightTextColor : Generic.Style.tableTextColor
            text: styleData.value
        }
        Component.onCompleted: {
            if (selectRow > -1) {
                tableView.currentRow = selectRow
                tableView.selection.select(tableView.currentRow)
            }
        }
    }
    */

}
