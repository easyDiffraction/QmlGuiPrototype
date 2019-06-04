import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import easyAnalysis.ContentArea 1.0 as GenericContentArea

GenericContentArea.Button {
    Layout.fillWidth: true
    icon.source: "../../Icons/Plus.svg" // https://www.flaticon.com/free-icon/plus-sign-in-a-black-circle_25340
    ToolTip.text: qsTr("Add new row to the table above")
}


