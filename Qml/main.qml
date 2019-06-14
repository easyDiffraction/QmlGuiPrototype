import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12
import Qt.labs.settings 1.1
import easyAnalysis 1.0 as Generic
import easyAnalysis.App 1.0 as GenericApp
import easyAnalysis.App.Menubar 1.0 as GenericAppMenubar
import easyAnalysis.App.Toolbar 1.0 as GenericAppToolbar
import easyAnalysis.App.ContentArea 1.0 as GenericAppContentArea
import easyAnalysis.Logic 1.0 as GenericLogic
import easyDiffraction 1.0 as Specific

ApplicationWindow {
    id: window

    visible: true
    color: Generic.Style.appBkgColor
    title: Specific.Settings.appName

    minimumWidth: Generic.Style.appWindowWidth
    minimumHeight: Generic.Style.appWindowHeight
    x: (Screen.width - width) / 2
    y: (Screen.height - height) / 2

    font.family: Generic.Style.fontFamily
    font.pointSize: Generic.Style.fontPointSize

    // Persistent application settings
    //Settings {
        //property alias x: window.x
        //property alias y: window.y
        //property alias width: window.width
        //property alias height: window.height
    //}

    // Introduction animation
    GenericApp.Intro {}

    // Application menubar
    ///GenericAppMenubar.Menubar {}

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

    // Persistent settings
    Settings { id: settings }

    // On completed
    Component.onCompleted: {
        // Load and parse example data
        const xhr = new XMLHttpRequest()
        xhr.open("GET", Specific.Variables.resourcesPath + "Examples/CeCuAl3_POLARIS/cecual.txt", false)
        xhr.send()
        Generic.Variables.xObs = GenericLogic.Parse.getColumn(xhr.responseText, 0, 1)
        Generic.Variables.yObs = GenericLogic.Parse.getColumn(xhr.responseText, 1, 1)
        Generic.Variables.syObs = GenericLogic.Parse.getColumn(xhr.responseText, 2, 1)
        Generic.Variables.yCalc = GenericLogic.Parse.getColumn(xhr.responseText, 3, 1)
        Generic.Variables.yPreCalc = GenericLogic.Parse.getColumn(xhr.responseText, 4, 1)

        // Load persistent settings
        Generic.Variables.showIntro = settings.value("showIntro", Generic.Variables.showIntro)
        Generic.Variables.showGuide = settings.value("showGuide", Generic.Variables.showGuide)
    }

    // On destruction
    Component.onDestruction: {
        // Save persistent settings
        settings.setValue("showIntro", Generic.Variables.showIntro)
        settings.setValue("showGuide", Generic.Variables.showGuide)
    }

}


