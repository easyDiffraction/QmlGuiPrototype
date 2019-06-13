import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import easyAnalysis 1.0 as Generic
import easyAnalysis.App.ContentArea 1.0 as GenericAppContentArea

GenericAppContentArea.Button {
    Layout.fillWidth: true
    icon.source: Generic.Variables.iconsPath + "Plus.svg" // https://www.flaticon.com/free-icon/plus-sign-in-a-black-circle_25340
    ToolTip.text: qsTr("Add new row to the table above")
}

