import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Qt.labs.platform 1.0
import QtQuick.Window 2.12
import QtCharts 2.3
import easyAnalysis 1.0 as Generic
import easyAnalysis.Elements 1.0 as GenericElements
import easyAnalysis.Toolbar 1.0 as GenericToolbar
import easyAnalysis.ContentArea 1.0 as GenericContentArea
import easyAnalysis.Logic 1.0 as GenericLogic
import easyDiffraction 1.0 as Specific

ApplicationWindow {
    visible: true

    minimumWidth: Generic.Style.appWindowWidth
    minimumHeight: Generic.Style.appWindowHeight
    x: (Screen.width - width) / 2
    y: (Screen.height - height) / 2

    color: Generic.Style.appBkgColor

    title: Specific.Settings.appName

    //property int toolbarCurrentIndex: -1


    MenuBar {

        Menu {
            title: qsTr("&File")
            MenuItem {
                text: qsTr("&Open")
                onTriggered: messageDialog.show(qsTr("Open action triggered"))
            }

            MenuItem {
                text: qsTr("E&xit")
                onTriggered: Qt.quit()
            }
        }

        Menu {
            title: qsTr("&Help")
            MenuItem {
                text: qsTr("&Help")
                onTriggered: messageDialog.show(qsTr("Open action triggered"))
            }
            MenuItem {
                text: qsTr("&Show User Guides")
                checkable: true
                checked: Generic.Variables.showGuide
                onTriggered: Generic.Variables.showGuide = checked
            }
            MenuItem {
                text: qsTr("&About")
                onTriggered: Qt.quit()
            }
        }
    }

    /*
    Action {
        id: copyAction
        text: qsTr("&Copy")
        icon.name: "edit-copy"
        shortcut: StandardKey.Copy
        onTriggered: window.activeFocusItem.copy()
    }

    MenuItem {
        id: menuItem
        action: copyAction
        text: qsTr("&Copy selected Text")
    }


    MenuBar {
        id: menuBar

        Menu {
            id: fileMenu
            title: qsTr("File")
            // ...
        }

        Menu {
            id: editMenu
            title: qsTr("&Edit")
            // ...
        }

        Menu {
            id: viewMenu
            title: qsTr("&View")
            // ...
        }

        Menu {
            id: helpMenu
            title: qsTr("&Help")
            // ...
        }
    }
    */

    ColumnLayout {
        anchors.fill: parent
        spacing: 0
        GenericToolbar.Toolbar {}
        GenericContentArea.ContentArea {}
    }

    Component.onCompleted: {
        const xhr = new XMLHttpRequest
        xhr.open("GET", "../Imports/easyAnalysis/DiffractionData/cecual.txt", false)
        xhr.send()

        Generic.Variables.xObs = GenericLogic.Parse.getColumn(xhr.responseText, 0, 1)
        Generic.Variables.yObs = GenericLogic.Parse.getColumn(xhr.responseText, 1, 1)
        Generic.Variables.syObs = GenericLogic.Parse.getColumn(xhr.responseText, 2, 1)
        Generic.Variables.yCalc = GenericLogic.Parse.getColumn(xhr.responseText, 3, 1)
        Generic.Variables.yCalcBad = GenericLogic.Parse.getColumn(xhr.responseText, 4, 1)

        //console.log(Generic.Variables.yObs)
    }

}
