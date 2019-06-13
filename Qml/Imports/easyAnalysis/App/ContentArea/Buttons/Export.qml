import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import easyAnalysis 1.0 as Generic
import easyAnalysis.App.ContentArea 1.0 as GenericAppContentArea

GenericAppContentArea.Button {
    Layout.fillWidth: true
    icon.source: Generic.Variables.iconsPath + "Download.svg" // https://www.flaticon.com/free-icon/download-to-storage-drive_25407
    ToolTip.text: qsTr("Export selected model")
}


