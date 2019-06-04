import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import easyAnalysis.ContentArea 1.0 as GenericContentArea

GenericContentArea.Button {
    Layout.fillWidth: true
    icon.source: "../../Icons/TrashCan.svg" // https://www.iconfinder.com/icons/3844425/can_trash_icon
    ToolTip.text: qsTr("Remove all rows from the table above")
}


