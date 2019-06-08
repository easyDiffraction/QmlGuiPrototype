import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import easyAnalysis.Elements 1.0 as GenericElements

ColumnLayout {
    spacing: 0

    ///////////
    // Groupbox
    ///////////
    GenericElements.GroupBox {
        title: "View settings"
        content: GenericElements.GridLayout {
            columns: 2
            GenericElements.CheckBox { checked:true;  text:qsTr("Show experimental data") }
            GenericElements.CheckBox { checked:true;  text:qsTr("Show difference plot") }
            GenericElements.CheckBox { checked:false; text:qsTr("Show Bragg positions") }
            GenericElements.CheckBox { checked:false; text:qsTr("Show legend") }
            //GenericElements.CheckBox { Layout.fillWidth:true; checked:true;  text:qsTr("Display coordinate system") }
        }
    }

    ///////////
    // Groupbox
    ///////////
    GenericElements.GroupBox {
        title: "Minimizer"
        content: GenericElements.GridLayout {
            columns: 2
            columnSpacing: 20
            // Row
            Text { text: qsTr("Type") }
            GenericElements.ComboBox {
                model: ["Minuit2", "GSL Levenberg-Marquat", "TMVA Genetic"]
                Layout.fillWidth: true
            }
            // Row
            Text { text: qsTr("Algorithm") }
            GenericElements.ComboBox {
                model: ["Migrad", "Simplex", "Combined", "Scan"]
                Layout.fillWidth: true
            }
            // Row
            Text { text: qsTr("Tolerance") }
            TextField { Layout.fillWidth: true; implicitHeight: 32; text: "0.01"}
        }
    }



    /////////
    // Spacer
    /////////
    Item { Layout.fillHeight: true }

}
