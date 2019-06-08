import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import easyAnalysis.ContentArea 1.0 as GenericContentArea
import easyAnalysis 1.0 as Generic

Item {
    property bool isSample: true
    
    implicitHeight: Generic.Style.tableRowHeight
    implicitWidth: implicitHeight

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

        GenericContentArea.Button {
            id: button
            anchors.fill: parent
            anchors.margins: 2
            anchors.leftMargin: 3
            anchors.rightMargin: 4
            padding: 0
            icon.source: isSample ? "../../Icons/Diamond.svg" : "../../Icons/Microscope.svg"

            background: Rectangle {
                color: "transparent"
            }
        }
    }
}
