import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls 1.4 as Controls1
import QtQuick.Layouts 1.12
import easyAnalysis 1.0 as Generic
import easyAnalysis.App.Elements 1.0 as GenericAppElements
import easyAnalysis.App.ContentArea 1.0 as GenericAppContentArea
import easyAnalysis.App.ContentArea.Buttons 1.0 as GenericAppContentAreaButtons
import easyAnalysis.Logic 1.0 as GenericLogic

Rectangle {
    width: Generic.Variables.mainAreaWidth // fix
    color: "white"

    GenericAppElements.ParametersTable {
        customFrameVisible: false
        anchors.fill: parent
        model: ListModel {
            ListElement { jobIndex:0; dataIndex:0; sampleIndex:0; instrumentIndex:0; jobName:"POLARIS CeCuAl3                                     " }
            ListElement { jobIndex:1; dataIndex:0; sampleIndex:0; instrumentIndex:0; jobName:"POLARIS CeCuAl3 + Al" }
            ListElement { jobIndex:1; dataIndex:0; sampleIndex:1; instrumentIndex:0; jobName:"&POLARIS CeCuAl3 + Al" }
            ListElement { jobIndex:2; dataIndex:0; sampleIndex:0; instrumentIndex:0; jobName:"POLARIS CeCuAl3 + Al & DREAM CeCuAl3" }
            ListElement { jobIndex:2; dataIndex:0; sampleIndex:1; instrumentIndex:0; jobName:"&POLARIS CeCuAl3 + Al & DREAM CeCuAl3" }
            ListElement { jobIndex:2; dataIndex:1; sampleIndex:0; instrumentIndex:1; jobName:"&POLARIS CeCuAl3 + Al & DREAM CeCuAl3" }
        }
        Controls1.TableViewColumn { role:"jobIndex"; title:"No."; resizable: false; delegate: GenericAppElements.CellComboBox { currentIndex: styleData.value;
                model: ["1", "2", "3"] } }

        Controls1.TableViewColumn { role:"jobName"; title:"Job Name" }

        Controls1.TableViewColumn { role:"dataIndex"; title:"Experimental Data"; delegate: GenericAppElements.CellComboBox { currentIndex: styleData.value;
                model: ["cecual_polaris.dat", "cecual_dream.dat", "cecual_d2b.dat", "cecual_01_test.dat", "cecual_02_test.dat", "cecual_03_test.dat", "cecual_04_test.dat"] } }

        Controls1.TableViewColumn { role:"sampleIndex"; title:"Sample Model"; delegate: GenericAppElements.CellComboBox { currentIndex: styleData.value;
                model: ["CeCuAl3", "Al"] } }

        Controls1.TableViewColumn { role:"instrumentIndex"; title:"Instrument Model"; delegate: GenericAppElements.CellComboBox { currentIndex: styleData.value;
                model: ["POLARIS", "DREAM"] } }

        Controls1.TableViewColumn { role:"remove"; title:"Remove"; resizable: false }
    }
}

