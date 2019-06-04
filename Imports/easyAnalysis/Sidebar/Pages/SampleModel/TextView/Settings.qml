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
            GenericElements.CheckBox { checked:false; text:qsTr("Highlight syntax") }
            GenericElements.CheckBox { checked:false; text:qsTr("Wrap text") }
        }
    }

    /////////
    // Spacer
    /////////
    Item { Layout.fillHeight: true }

}
