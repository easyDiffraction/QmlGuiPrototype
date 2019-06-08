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
        title: "Jobs"
        collapsible: false
        content: GenericElements.ColumnLayout {
            // Table
            GenericElements.ParametersTable {
                selectable: true
                model: ListModel {
                    ListElement { num:"1"; name: "POLARIS CeCuAl3" }
                    ListElement { num:"2"; name: "POLARIS CeCuAl3 + Al" }
                    ListElement { num:"3"; name: "POLARIS CeCuAl3 + Al & DREAM CeCuAl3" }
                }
                Controls1.TableViewColumn { role:"num";    title:"No.";  resizable: false }
                Controls1.TableViewColumn { role:"name";   title:"Name" }
                Controls1.TableViewColumn { role:"remove"; title:"Remove"; resizable: false }
            }
        }
    }

    ///////////
    // Groupbox
    ///////////
    GenericElements.GroupBox {
        title: "Add/remove constraints"
        collapsible: false
        content: GenericElements.ColumnLayout {
            // Buttons
            GenericElements.GridLayout {
                columns: 2

                GenericContentAreaButtons.Add { id: addButton; text: "Add new constraint"; }
                GenericContentAreaButtons.RemoveAll { text: "Remove all constraints" }
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
                    Generic.Variables.analysisPageFinished = true
                    Generic.Variables.summaryPageFinished = true
                    Generic.Variables.toolbarCurrentIndex = Generic.Variables.AnalysisIndex
                }
            }
            GenericContentAreaButtons.SaveState {}
            GenericContentAreaButtons.Help {}
        }
    }

}

