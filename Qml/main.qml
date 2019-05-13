import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtCharts 2.3
import easyAnalysis 1.0 as Generic
import easyAnalysis.Elements 1.0 as GenericElements
import easyAnalysis.Toolbar 1.0 as GenericToolbar
import easyAnalysis.Logic 1.0 as GenericLogic
import easyDiffraction 1.0 as Specific

ApplicationWindow {
    visible: true

    minimumWidth: Generic.Style.appWindowWidth
    minimumHeight: Generic.Style.appWindowHeight
    color: Generic.Style.appBkgColor

    title: Specific.Settings.appName

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        GenericToolbar.Toolbar {}

        StackLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            //currentIndex: tabBar.currentIndex

            Rectangle {
                color: "white"
            }
            Rectangle {
                color: "darkseagreen"
            }
            Rectangle {
                color: "lightblue"
            }
        }
    }
}
