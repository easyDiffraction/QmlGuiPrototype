import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls 1.4 as Controls1
import QtQuick.Layouts 1.12
import QtCharts 2.3
import easyAnalysis 1.0 as Generic
import easyAnalysis.App.Elements 1.0 as GenericAppElements

Rectangle {
    property real coeff: 0.7
    property int extraPadding: 12
    property int ratio: 3

    property int commonMargin: 10

    id: wrapper


    ScrollView {
        anchors.fill: parent
        clip: true


        GenericAppElements.ColumnLayout {


            ///////
            // JOB
            //////

            TextArea {
                Layout.fillWidth: true
                padding: commonMargin
                readOnly: true
                antialiasing: true
                textFormat: Text.RichText
                text:
"
<h1>CeCuAl3_experiment</h1>
<p><b>Creation date:</b> 11.04.2019</p>

<h2><u>Job 1</u></h2>
<p>
<b>Experimental data:</b> cecual_polaris.dat<br>
<b>Sample model:</b> CeCuAl3<br>
<b>Instrument model:</b> POLARIS
</p>

<h2>Parameters</h2>
"
            }

            /////////////
            // PARAMETERS
            /////////////

            Row {
                // Left margin
                Item { width: 1.5*commonMargin; height: 1 }
                // Table
                GenericAppElements.ParametersTable {
                    width: Generic.Variables.mainAreaWidth - 3*commonMargin
                    enabled: false
                    selectable: false
                    visibleRowsCount: 6
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
           }

            /////////////////////
            // OBS VS. CALC title
            /////////////////////

            TextArea {
                Layout.fillWidth: true
                padding: commonMargin
                bottomPadding: 0
                readOnly: true
                antialiasing: true
                textFormat: Text.RichText
                text:
"
<h2>Fitting</h2>
"
            }

            ///////////////////////
            // OBS VS. CALC figures
            ///////////////////////

            Column {
                width: Generic.Variables.mainAreaWidth
                height: width * 0.9
                GenericAppElements.ChartView {
                    width: parent.width
                    height: parent.height
                    showObs: true
                    showCalc: true
                    showDiff: true
                }
            }

        }
    }
}

