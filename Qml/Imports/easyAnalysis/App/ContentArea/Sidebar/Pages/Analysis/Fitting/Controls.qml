import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls 1.4 as Controls1
import QtQuick.Layouts 1.12
import easyAnalysis 1.0 as Generic
import easyAnalysis.App.Elements 1.0 as GenericAppElements
import easyAnalysis.App.ContentArea 1.0 as GenericAppContentArea
import easyAnalysis.App.ContentArea.Buttons 1.0 as GenericAppContentAreaButtons
import easyAnalysis.Logic 1.0 as GenericLogic

ColumnLayout {
    spacing: 0

    property bool isFitting: true

    ///////////
    // Groupbox
    ///////////
    GenericAppElements.GroupBox {
        title: "Jobs"
        collapsible: false
        content: GenericAppElements.ColumnLayout {
            // Table
            GenericAppElements.ParametersTable {
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
    GenericAppElements.GroupBox {
        title: "Parameters"
        collapsed: false
        content: GenericAppElements.ColumnLayout {
            // Table
            GenericAppElements.ParametersTable {
                selectable: true
                selectedRow: 0
                model: ListModel {
                    ListElement { num:"1"; type:"sample";      parameter:"CeCuAl3 a    "; started:"4.25";  min:"4.00";     max:"5.00";     fit:true;   refined:"4.2598";   error:"0.0001" }
                    ListElement { num:"2"; type:"sample";      parameter:"CeCuAl3 c    "; started:"10.60"; min:"10.00";    max:"11.00";    fit:true;   refined:"10.6339";  error:"0.0020" }
                    ListElement { num:"3"; type:"sample";      parameter:"CeCuAl3 Cu1 z"; started:"0.63";  min:"0.00";     max:"1.00";     fit:true;   refined:"0.6322";   error:"0.0001" }
                    ListElement { num:"4"; type:"sample";      parameter:"CeCuAl3 Al1 z"; started:"0.63";  min:"0.00";     max:"1.00";     fit:true;   refined:"0.6322";   error:"0.0001" }
                    ListElement { num:"5"; type:"instrument";  parameter:"POLARIS Sig-1"; started:"60.00"; min:"0.00";     max:"90.00";    fit:true;   refined:"61.676";   error:"1.098" }
                    ListElement { num:"6"; type:"instrument";  parameter:"POLARIS Sig-2"; started:"0.00";  min:"";         max:"";         fit:false;  refined:"";         error:"" }
                }
                Controls1.TableViewColumn { role:"num";         title:"No.";  resizable: false }
                Controls1.TableViewColumn { role:"type";        title:"Type"; resizable: false }
                Controls1.TableViewColumn { role:"parameter";   title:"Parameter" }
                Controls1.TableViewColumn { role:"started";     title:"Started" }
                Controls1.TableViewColumn { role:"min";         title:"Min" }
                Controls1.TableViewColumn { role:"max";         title:"Max" }
                Controls1.TableViewColumn { role:"fit";         title:"Fit"; resizable: false }
                Controls1.TableViewColumn { role:"refined";     title:"Refined" }
                Controls1.TableViewColumn { role:"error";       title:"Error" }
            }

            // Slider
            GenericAppElements.RowLayout {
                Text { text: "4.00" }
                Slider {
                    Layout.fillWidth: true
                    padding: 0
                    from: 4.00
                    value: 4.25
                    to: 5.00
                }
                Text { text: "5.00" }
            }


            // Buttons
            GenericAppElements.GridLayout {
                columns: 2

                GenericAppContentAreaButtons.PausePlay { id: pausePlayButton; text: "Start/Stop fitting"; }
                CheckBox { checked: true; text: "Auto-update"; }

                GenericAppContentAreaButtons.Accept { text: "Accept refined parameters"; }
                CheckBox { checked: false; text: "Auto-accept"; }

                GenericAppElements.GuideWindow {
                    id: guidWindow
                    message: "Click here to start or stop fitting."
                    toY: pausePlayButton.y + pausePlayButton.height / 2

                    visible: Generic.Variables.showGuide && Generic.Variables.toolbarCurrentIndex === Generic.Variables.AnalysisIndex ? true : false

                    GenericAppContentAreaButtons.Add { id: pausePlayButtonClone }
                    Component.onCompleted: {
                        GenericLogic.Copy.copyButton(pausePlayButton, pausePlayButtonClone)
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
    GenericAppElements.GroupBox {
        collapsible: false
        showBorder: false
        content: GenericAppElements.RowLayout {
            GenericAppContentAreaButtons.GoNext {
                text: "Next step: Summary"
                ToolTip.text: qsTr("Go to the next step: Summary")
                onClicked: {
                    Generic.Variables.analysisPageFinished = true
                    Generic.Variables.summaryPageFinished = true
                    Generic.Variables.toolbarCurrentIndex = Generic.Variables.SummaryIndex
                }
            }
            GenericAppContentAreaButtons.SaveState { checked: true }
            GenericAppContentAreaButtons.Help {}
            GenericAppContentAreaButtons.Bug {}
        }
    }

}

