import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import easyAnalysis.ContentArea 1.0 as GenericContentArea
import easyAnalysis 1.0 as Generic

Item {
    implicitHeight: Generic.Style.tableRowHeight - 2 * button.anchors.margins
    implicitWidth: implicitHeight

    GenericContentArea.Button {
        id: button
        anchors.fill: parent
        anchors.margins: 2
        icon.source: "../../Icons/Minus.svg" // https://www.flaticon.com/free-icon/minus-sign-inside-a-black-circle_25336
        ToolTip.text: qsTr("Remove this row from the table")
    }
}
