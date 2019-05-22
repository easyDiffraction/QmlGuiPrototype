import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import easyAnalysis.Elements 1.0 as GenericElements

Column {
    anchors.fill: parent

    ///////////
    // Groupbox
    ///////////
    GenericElements.GroupBox {
        title: "Settings View"

        content: ColumnLayout {
            spacing: 0

            // Set column widths
            Rectangle { width: 20; height: 0}
            Rectangle { Layout.fillWidth: true; height: 0}

            // Row
            GenericElements.CheckBox {
                checked: true
                text: qsTr("Show layers' names")
            }
        }
    }

}
