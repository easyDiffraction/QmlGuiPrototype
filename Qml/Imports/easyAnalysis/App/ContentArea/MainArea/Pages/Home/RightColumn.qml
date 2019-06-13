import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import easyAnalysis 1.0 as Generic
import easyAnalysis.App.ContentArea 1.0 as GenericAppContentArea

ColumnLayout {
    //Layout.fillWidth: true
    Layout.preferredWidth: 1
    Layout.alignment: Qt.AlignTop
    spacing: 20

    GenericAppContentArea.Button {
        Layout.fillWidth: true
        //width: parent.width
        text: "Save Project As..."
        icon.source: Generic.Variables.iconsPath + "Download.svg" // https://www.flaticon.com/free-icon/download-to-storage-drive_25407
        ToolTip.text: qsTr("Save project as...")
    }

}
