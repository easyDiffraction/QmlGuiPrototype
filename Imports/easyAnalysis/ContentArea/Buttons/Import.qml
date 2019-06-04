import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import easyAnalysis.ContentArea 1.0 as GenericContentArea

GenericContentArea.Button {
    Layout.fillWidth: true
    icon.source: "../../Icons/Upload.svg" // https://www.flaticon.com/free-icon/upload_25635
    ToolTip.text: qsTr("Import model")
}


