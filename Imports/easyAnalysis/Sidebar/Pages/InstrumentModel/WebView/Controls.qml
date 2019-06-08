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
        title: "Instruments"
        collapsible: false
        content: GenericElements.ColumnLayout {
            // Table
            GenericElements.ParametersTable {
                selectable: true
                selectedRow: 1
                model: ListModel {
                    ListElement { num:"1"; name:"POLARIS";   note:"Loaded from Nexus" }
                    ListElement { num:"2"; name:"DREAM"; note:"Loaded from Nexus" }
                }
                Controls1.TableViewColumn { role:"num";     title:"No.";    resizable: false }
                Controls1.TableViewColumn { role:"name";    title:"Name";   resizable: false }
                Controls1.TableViewColumn { role:"note";    title:"Note" }
                Controls1.TableViewColumn { role:"remove"; title:"Remove"; resizable: false }
            }

            // Buttons
            GenericElements.GridLayout {
                columns: 2

                GenericContentAreaButtons.Add { id: addButton; text: "Add new instrument"; }
                GenericContentAreaButtons.RemoveAll { text: "Remove all instruments" }
                GenericContentAreaButtons.Import { id: importButton; text: "Import new instrument" }
                GenericContentAreaButtons.Export { text: "Export selected instrument" }

                GenericElements.GuideWindow {
                    id: guidWindow
                    message: "Click here to add or import a new instrument."
                    toY: (addButton.y + addButton.height + importButton.y) / 2

                    visible: Generic.Variables.showGuide && Generic.Variables.toolbarCurrentIndex === Generic.Variables.InstrumentModelIndex ? true : false

                    GenericContentAreaButtons.Add { id: addButtonClone }
                    GenericContentAreaButtons.Import { id: importButtonClone }
                    Component.onCompleted: {
                        GenericLogic.Copy.copyButton(addButton, addButtonClone)
                        GenericLogic.Copy.copyButton(importButton, importButtonClone)
                    }
                }
            }
        }
    }

    ///////////
    // Groupbox
    ///////////
    GenericElements.GroupBox {
        title: "Instrument type"
        collapsed: true
        content: GenericElements.ColumnLayout {
            GenericElements.GridLayout {
                columns: 3
                rowSpacing: 2
                Text { text: "Facility"; color: Generic.Style.sidebarLabelColor; font.pointSize: 12 }
                Text { text: "Instrument"; color: Generic.Style.sidebarLabelColor; font.pointSize: 12  }
                Text { text: "Configuration"; color: Generic.Style.sidebarLabelColor; font.pointSize: 12  }
                GenericElements.ComboBox { currentIndex: 0; model: ["ESS", "ISIS", "SNS", "ILL", "MLZ", "Custom"] }
                GenericElements.ComboBox { currentIndex: 2; model: ["BEER", "D2B", "DREAM", "HEIMDAL", "MAGiC", "POLARIS", "Custom neutron", "Custom X-ray"] }
                GenericElements.ComboBox { currentIndex: 0; model: ["Standard"] }
            }
        }
    }

    ///////////
    // Groupbox
    ///////////
    GenericElements.GroupBox {
        title: "Instrument parameters"
        collapsed: true
        content: GridLayout {
            columns: 9
            columnSpacing: 15
            rowSpacing: 10
            // Row
            Text { text: qsTr("Zero") }
            TextField { Layout.fillWidth: true; implicitHeight: 32; text: "2.921"; horizontalAlignment: Text.AlignRight}
            Text { text: ""; color: "dimgray" }
            Text { text: qsTr("Dtt-1") }
            TextField { Layout.fillWidth: true; implicitHeight: 32; text: "6167.247"; horizontalAlignment: Text.AlignRight}
            Text { text: ""; color: "dimgray" }
            Text { text: qsTr("Dtt-2") }
            TextField { Layout.fillWidth: true; implicitHeight: 32; text: "-2.280"; horizontalAlignment: Text.AlignRight}
            Text { text: ""; color: "dimgray" }
            // Row
            Text { text: qsTr("Gam-2") }
            TextField { Layout.fillWidth: true; implicitHeight: 32; text: "0.000"; horizontalAlignment: Text.AlignRight}
            Text { text: ""; color: "dimgray" }
            Text { text: qsTr("Gam-1") }
            TextField { Layout.fillWidth: true; implicitHeight: 32; text: "0.604"; horizontalAlignment: Text.AlignRight}
            Text { text: ""; color: "dimgray" }
            Text { text: qsTr("Gam-0") }
            TextField { Layout.fillWidth: true; implicitHeight: 32; text: "0.000"; horizontalAlignment: Text.AlignRight}
            Text { text: ""; color: "dimgray" }
            // Row
            Text { text: qsTr("Sig-2") }
            TextField { Layout.fillWidth: true; implicitHeight: 32; text: "0.000"; horizontalAlignment: Text.AlignRight}
            Text { text: ""; color: "dimgray" }
            Text { text: qsTr("Sig-1") }
            TextField { Layout.fillWidth: true; implicitHeight: 32; text: "61.676"; horizontalAlignment: Text.AlignRight}
            Text { text: ""; color: "dimgray" }
            Text { text: qsTr("Sig-0") }
            TextField { Layout.fillWidth: true; implicitHeight: 32; text: "6.196"; horizontalAlignment: Text.AlignRight}
            Text { text: ""; color: "dimgray" }
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
                text: "Next step: Sample Model"
                ToolTip.text: qsTr("Go to the next step: Sample Model description")
                onClicked: {
                    Generic.Variables.instrumentPageFinished = true
                    Generic.Variables.toolbarCurrentIndex = Generic.Variables.SampleModelIndex
                }
            }
            GenericContentAreaButtons.SaveState {}
            GenericContentAreaButtons.Help {}
        }
    }

}

