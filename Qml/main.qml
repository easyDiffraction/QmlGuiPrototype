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

    minimumWidth: Generic.Variables.appWindowWidth
    minimumHeight: Generic.Variables.appWindowHeight
    x: Generic.Variables.appWindowX
    y: Generic.Variables.appWindowY

    font.family: Generic.Style.fontFamily
    font.pointSize: Generic.Style.fontPointSize

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
    Settings {
        id: settings
        property alias x: window.x
        property alias y: window.y
        property alias width: window.width
        property alias height: window.height
    }

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

        // Define some parameters
        Generic.Variables.mainAreaWidth = Generic.Variables.appWindowWidth - Generic.Style.appBorderThickness - Generic.Style.sidebarWidth

        // Load persistent settings
        console.log("---- load Generic.Variables.showIntro", Generic.Variables.showIntro)
        Generic.Variables.showIntro = settings.value("showIntro", Generic.Variables.showIntro)
        Generic.Variables.showGuide = settings.value("showGuide", Generic.Variables.showGuide)
        Generic.Variables.appWindowWidth = settings.value("appWindowWidth", Generic.Variables.appWindowWidth)
        Generic.Variables.appWindowHeight = settings.value("appWindowHeight", Generic.Variables.appWindowHeight)
        Generic.Variables.appWindowX = settings.value("appWindowX", (Screen.width - Generic.Variables.appWindowWidth) / 2)
        Generic.Variables.appWindowY = settings.value("appWindowY", (Screen.height - Generic.Variables.appWindowHeight) / 2)
    }

    // On destruction
    Component.onDestruction: {
        // Save persistent settings
        settings.setValue("showIntro", Generic.Variables.showIntro)
        settings.setValue("showGuide", Generic.Variables.showGuide)
        settings.setValue("appWindowWidth", window.width)
        settings.setValue("appWindowHeight", window.height)
        settings.setValue("appWindowX", window.x)
        settings.setValue("appWindowY", window.y)
        console.log("---- save Generic.Variables.showIntro", Generic.Variables.showIntro)
    }
}


