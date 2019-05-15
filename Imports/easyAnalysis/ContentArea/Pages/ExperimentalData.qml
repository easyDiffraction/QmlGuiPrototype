import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import easyAnalysis 1.0 as Generic
import easyAnalysis.Elements 1.0 as GenericElements
import easyAnalysis.ContentArea 1.0 as GenericContentArea
import easyAnalysis.ContentArea.Buttons 1.0 as GenericContentAreaButtons

Item {
    ColumnLayout {
        width: (parent.width - 30*4 ) / 3
        anchors.centerIn: parent
        spacing: 20

        GenericContentArea.Button {
            Layout.fillWidth: true
            text: "Add data from local drive"
            icon.source: "../../Icons/Upload.svg" // https://www.flaticon.com/free-icon/upload_25635
            ToolTip.text: qsTr("Add data from local drive")
        }

        GenericContentArea.Button {
            Layout.fillWidth: true
            text: "Select data from SciCat"
            icon.source: "../../Icons/SciCat.png"
            ToolTip.text: qsTr("Select data from SciCat")
        }

        Text {
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            text: qsTr("or, if only simulations are needed,")
        }

        GenericContentAreaButtons.GoNext {
            text: "Next step: Sample Model"
            ToolTip.text: qsTr("Go to the next step: Sample Model description")
        }

        GenericElements.HorizontalBorder {}

        RowLayout {
            spacing: 10

            GenericContentAreaButtons.Help {
                text: qsTr("Online help")
                Layout.fillWidth: true
                Layout.preferredWidth: 1
            }

            GenericContentAreaButtons.SaveState {
                text: qsTr("Save current state")
                Layout.fillWidth: true
                Layout.preferredWidth: 1
            }
        }
    }
}


