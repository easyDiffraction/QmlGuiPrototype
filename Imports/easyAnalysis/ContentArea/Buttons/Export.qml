import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import easyAnalysis.ContentArea 1.0 as GenericContentArea

GenericContentArea.Button {
    Layout.fillWidth: true
    icon.source: "../../Icons/Download.svg" // https://www.flaticon.com/free-icon/download-to-storage-drive_25407
    ToolTip.text: qsTr("Export selected model")
}


