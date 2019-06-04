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
            GenericElements.CheckBox { checked:false; text:qsTr("Show legend") }
            //GenericElements.CheckBox { checked:true;  text:qsTr("Display coordinate system") }
            //GenericElements.CheckBox { Layout.fillWidth:true; checked:true;  text:qsTr("Display coordinate system") }
        }
    }

    /////////
    // Spacer
    /////////
    Item { Layout.fillHeight: true }

}
