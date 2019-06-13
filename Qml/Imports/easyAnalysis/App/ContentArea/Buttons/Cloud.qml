import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import easyAnalysis 1.0 as Generic
import easyAnalysis.App.ContentArea 1.0 as GenericAppContentArea

GenericAppContentArea.Button {
    Layout.fillWidth: true
    icon.source: Generic.Variables.iconsPath + "Cloud.svg" // https://www.iconfinder.com/icons/352275/cloud_download_icon
    //icon.source: "../../Icons/Cloud.svg" // https://www.flaticon.com/free-icon/cloud-computing_149754#term=cloud&page=2&position=23
    //ToolTip.text: qsTr("")
}



