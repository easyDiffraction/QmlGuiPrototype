import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Layouts 1.12
import Qt.labs.settings 1.1
import easyAnalysis 1.0 as Generic
import easyAnalysis.App.Elements 1.0 as GenericAppElements
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

    GenericAppContentArea.Button {
        Layout.fillWidth: true
        //width: parent.width
        text: "Application Settings"
        icon.source: Generic.Variables.iconsPath + "Settings.svg" // https://www.flaticon.com/free-icon/settings-work-tool_70367
        //ToolTip.text: qsTr("Save project as...")
        onClicked: settingsDialog.open()
    }

    // Persistent settings
    Settings { id: settings }

    // Settings window
    Dialog {
        id: settingsDialog
        title: "Application settings"

        modal: true
        background: Rectangle { color: "white" }
        Overlay.modal: Rectangle { color: Color.transparent("black", 0.5) }

        standardButtons: Dialog.Ok

        GenericAppElements.ColumnLayout {
            anchors.fill: parent

            GenericAppElements.CheckBox {
                text: qsTr("Show Animated Intro")
                checked: Generic.Variables.showIntro
                onCheckStateChanged: Generic.Variables.showIntro = checked
            }

            GenericAppElements.CheckBox {
                text: qsTr("Show User Guides")
                checked: Generic.Variables.showGuide
                onCheckStateChanged: Generic.Variables.showGuide = checked
            }
        }
    }
}
