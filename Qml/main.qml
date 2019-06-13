import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12
import easyAnalysis 1.0 as Generic
import easyAnalysis.App 1.0 as GenericApp
import easyAnalysis.App.Menubar 1.0 as GenericAppMenubar
import easyAnalysis.App.Toolbar 1.0 as GenericAppToolbar
import easyAnalysis.App.ContentArea 1.0 as GenericAppContentArea
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

    // Introduction animation
    GenericApp.Intro {}

    // Application menubar
    GenericAppMenubar.Menubar {}

    // Application window layout
    ColumnLayout {
        anchors.fill: parent
        spacing: 0
        GenericAppToolbar.Toolbar {}
        GenericAppContentArea.ContentArea {}
    }

    // Set paths related to the current file
    Image {
        visible: false
        source: Generic.Style.dummyIconPath
        onSourceChanged: {
            const currentFilePath = GenericLogic.Misc.dirFromPath(source.toString())
            Specific.Variables.resourcesPath = currentFilePath + "Imports/easyDiffraction/Resources/"
            Generic.Variables.resourcesPath = currentFilePath + "Imports/easyAnalysis/Resources/"
            Generic.Variables.iconsPath = Generic.Variables.resourcesPath + "Icons/"
        }
    }

    // Load and parse example data
    Component.onCompleted: {
        const xhr = new XMLHttpRequest()
        xhr.open("GET", Specific.Variables.resourcesPath + "Examples/CeCuAl3_POLARIS/cecual.txt", false)
        xhr.send()
        Generic.Variables.xObs = GenericLogic.Parse.getColumn(xhr.responseText, 0, 1)
        Generic.Variables.yObs = GenericLogic.Parse.getColumn(xhr.responseText, 1, 1)
        Generic.Variables.syObs = GenericLogic.Parse.getColumn(xhr.responseText, 2, 1)
        Generic.Variables.yCalc = GenericLogic.Parse.getColumn(xhr.responseText, 3, 1)
        Generic.Variables.yPreCalc = GenericLogic.Parse.getColumn(xhr.responseText, 4, 1)
   }

}


