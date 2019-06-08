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
        title: "Data Explorer"
        collapsible: false
        content: GenericElements.ColumnLayout {
            // Table
            GenericElements.ParametersTable {
                selectable: true
                selectedRow: 1
                model: ListModel {
                    ListElement { num:"1"; fname: "cecual_polaris.dat"; fpath:"~/Experiments/ISIS/2019-01/cecual/" }
                    ListElement { num:"2"; fname: "cecual_dream.dat";   fpath:"~/Experiments/ESS/2019-03/cecual/" }
                    ListElement { num:"3"; fname: "cecual_d2b.dat";     fpath:"~/Experiments/ILL/2018-11/cecual/" }
                    ListElement { num:"4"; fname: "cecual_01_test.dat"; fpath:"~/Experiments/Test/2018-03/cecual/" }
                    ListElement { num:"5"; fname: "cecual_02_test.dat"; fpath:"~/Experiments/Test/2018-03/cecual/" }
                    ListElement { num:"6"; fname: "cecual_03_test.dat"; fpath:"~/Experiments/Test/2018-03/cecual/" }
                    ListElement { num:"7"; fname: "cecual_04_test.dat"; fpath:"~/Experiments/Test/2018-03/cecual/" }
                }
                Controls1.TableViewColumn { role:"num";    title:"No.";  resizable: false }
                Controls1.TableViewColumn { role:"fname";  title:"Name"; resizable: false }
                Controls1.TableViewColumn { role:"fpath";  title:"Path" }
                Controls1.TableViewColumn { role:"remove"; title:"Remove"; resizable: false }
            }

            // Buttons
            GenericElements.GridLayout {
                columns: 2

                GenericContentAreaButtons.Import { id: importButton; text: "Import data from local drive"; }
                GenericContentAreaButtons.Link { text: "Link to data on local drive"; }
                GenericContentAreaButtons.Cloud { id: cloudButton; text: "Import data from SciCat" }
                GenericContentAreaButtons.RemoveAll { text: "Remove all data" }

                GenericElements.GuideWindow {
                    id: guidWindow
                    //message: "Click here to add or import new data.\n\nSkip this step, if only simulations are needed."
                    message: "Click here to add or import new data."
                    toY: (importButton.y + importButton.height + cloudButton.y) / 2

                    visible: Generic.Variables.showGuide && Generic.Variables.toolbarCurrentIndex === Generic.Variables.ExperimentalDataIndex ? true : false

                    GenericContentAreaButtons.Import { id: importButtonClone }
                    GenericContentAreaButtons.Cloud { id: cloudButtonClone }
                    Component.onCompleted: {
                        GenericLogic.Copy.copyButton(importButton, importButtonClone)
                        GenericLogic.Copy.copyButton(cloudButton, cloudButtonClone)
                    }
                }
            }
        }
    }

    ///////////
    // Groupbox
    ///////////
    GenericElements.GroupBox {
        title: "Metadata"
        collapsed: true
        content: GenericElements.ColumnLayout {
            Text { text: "To be added" }
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
                text: "Next step: Instrument Model"
                ToolTip.text: qsTr("Go to the next step: Instrument Model description")
                onClicked: {
                    Generic.Variables.dataPageFinished = true
                    Generic.Variables.toolbarCurrentIndex = Generic.Variables.InstrumentModelIndex
                }
            }
            GenericContentAreaButtons.SaveState {}
            GenericContentAreaButtons.Help {}
        }
    }

}

