import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls 1.4 as Controls1
import QtQuick.Layouts 1.12
import easyAnalysis 1.0 as Generic
import easyAnalysis.Elements 1.0 as GenericElements
import easyAnalysis.ContentArea 1.0 as GenericContentArea
import easyAnalysis.ContentArea.Buttons 1.0 as GenericContentAreaButtons
import easyAnalysis.Logic 1.0 as GenericLogic

ColumnLayout {
    spacing: 0

    ///////////
    // Groupbox
    ///////////
    GenericElements.GroupBox {
        title: "Export elements"
        content: GenericElements.GridLayout {
            columns: 2
            GenericElements.CheckBox { checked:true;  text:qsTr("Parameters table") }
            GenericElements.CheckBox { checked:false; text:qsTr("Reliability factors") }
            GenericElements.CheckBox { checked:false; text:qsTr("Constraints table") }
            GenericElements.CheckBox { checked:true;  text:qsTr("Fitting figure") }
        }
    }

    ///////////
    // Groupbox
    ///////////
    GenericElements.GroupBox {
        title: "Export as..."
        content: GenericElements.ColumnLayout {
            GenericElements.RowLayout {
                GenericContentAreaButtons.Export { id: exportButton; implicitWidth: 60; text: "Export" }
                TextField { Layout.fillWidth: true; implicitHeight: 32; placeholderText: "Logbook File Name"; horizontalAlignment: Text.AlignRight}
                GenericElements.ComboBox { implicitWidth: 60; model: [".PDF", ".HTML"] }

                GenericElements.GuideWindow {
                    id: guidWindow
                    message: "Click here to export a logbook."
                    toY: exportButton.y + exportButton.height / 2

                    visible: Generic.Variables.showGuide && Generic.Variables.toolbarCurrentIndex === Generic.Variables.SummaryIndex ? true : false

                    GenericContentAreaButtons.Add { id: exportButtonClone }
                    Component.onCompleted: {
                        GenericLogic.Copy.copyButton(exportButton, exportButtonClone)
                    }
                }
            }
        }
    }

    /////////
    // Spacer
    /////////
    Item { Layout.fillHeight: true }

    ///////////
    // Groupbox
    ///////////
    GenericElements.GroupBox {
        collapsible: false
        showBorder: false
        content: GenericElements.RowLayout {
            GenericContentAreaButtons.GoNext {
                text: "Next step: Publication :-)"
                //ToolTip.text: qsTr("Go to the next step: Sample Model description")
                //onClicked: {
                //    Generic.Variables.toolbarCurrentIndex = Generic.Variables.SampleModelIndex
                //}
            }
            GenericContentAreaButtons.SaveState {}
            GenericContentAreaButtons.Help {}
        }
    }

}

