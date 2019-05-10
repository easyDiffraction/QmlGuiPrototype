import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtCharts 2.3
import easyAnalysis 1.0 as Generic
import easyAnalysis.Elements 1.0 as GenericElements
import easyAnalysis.Logic 1.0 as GenericLogic
import easyDiffraction 1.0 as Specific

ApplicationWindow {
    visible: true
    width: Generic.Style.appWindowWidth
    height: Generic.Style.appWindowHeight
    title: Specific.Settings.appName

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 30
        spacing: 10

        Button {
            Layout.alignment: Qt.AlignCenter
            text: "2 x 3 = " + GenericLogic.Math.multFunc(2, 3)
        }

        GenericElements.HelpButton {
            Layout.alignment: Qt.AlignCenter
        }
    }
}
