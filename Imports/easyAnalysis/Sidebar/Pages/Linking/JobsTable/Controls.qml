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
        title: "Add/remove jobs"
        collapsible: false
        content: GenericElements.ColumnLayout {
            // Buttons
            GenericElements.GridLayout {
                columns: 2

                GenericContentAreaButtons.Add { id: addButton; text: "Add new job"; }
                GenericContentAreaButtons.RemoveAll { text: "Remove all jobs" }

                GenericElements.GuideWindow {
                    id: guidWindow
                    message: "Click here to add a new job."
                    toY: addButton.y + addButton.height / 2

                    visible: Generic.Variables.showGuide && Generic.Variables.toolbarCurrentIndex === Generic.Variables.LinkingIndex ? true : false

                    GenericContentAreaButtons.Add { id: addButtonClone }
                    Component.onCompleted: {
                        GenericLogic.Copy.copyButton(addButton, addButtonClone)
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
                text: "Next step: Data analysis"
                ToolTip.text: qsTr("Go to the next step: Data analysis")
                onClicked: {
                    Generic.Variables.linkingPageFinished = true
                    Generic.Variables.toolbarCurrentIndex = Generic.Variables.AnalysisIndex
                }
            }
            GenericContentAreaButtons.SaveState {}
            GenericContentAreaButtons.Help {}
        }
    }

}

