//import QtQml 2.12
import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls 1.4 as Controls1
import QtQuick.Controls.impl 2.12
import QtQuick.Layouts 1.12
import Qt.labs.platform 1.0 as QtLabs
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


    property int animationDuration: Generic.Variables.showIntro ? Generic.Variables.introAnimationDuration : 0
    property int appNameFontSize: 50
    property int appVersionFontSize: 16
    property int repeatFontSize: 14
    property int continueFontSize: 24


    Dialog {
        id: dialog
        visible: true
        anchors.centerIn: parent
        width: parent.width
        height: parent.height

        background: Rectangle { color: "white" }

        Column {
            anchors.centerIn: parent
            width: parent.width
            spacing: 10

            Image {
                id: appIcon
                opacity: 0
                anchors.horizontalCenter: parent.horizontalCenter
                width: 110
                height: width
                //antialiasing: true
                //fillMode: Image.PreserveAspectFit
                source: "../Imports/easyAnalysis/Icons/App/App.svg"
                sourceSize: Qt.size( img.sourceSize.width, img.sourceSize.height )
                Image {
                    id: img
                    source: parent.source
                    width: 0
                    height: 0
                }
                ///GenericElements.AppUrlArea { anchors.fill: parent }
            }

            Item {
                id: container
                anchors.horizontalCenter: parent.horizontalCenter
                height: diffraction.height
                width: making.width + diffraction.width + dam.width + easy.width
                Text { id: making;      text: "Making ";                        opacity: 0; x: 0; font.family: Generic.Style.titleThinFontFamily; font.pointSize: appNameFontSize; color: "#444" }
                Text { id: diffraction; text: "diffraction";                    opacity: 0; x: making.width; font.family: Generic.Style.titleThickFontFamily; font.pointSize: appNameFontSize; color: "#666" }
                Text { id: dam;         text: " data analysis and modeling ";   opacity: 0; x: making.width + diffraction.width; font.family: Generic.Style.titleThinFontFamily; font.pointSize: appNameFontSize; color: "#444" }
                Text { id: easy;        text: "easy";                           opacity: 0; x: making.width + diffraction.width + dam.width; font.family: Generic.Style.titleThickFontFamily; font.pointSize: appNameFontSize; color: "#666" }
                ///GenericElements.AppUrlArea { anchors.fill: parent }
            }

            Text {
                id: appVersion
                opacity: 0
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: Generic.Style.versionFontFamily
                font.pointSize: appVersionFontSize
                text: "Version %1 (%2)".arg(Generic.Style.appVersion).arg(Generic.Style.appDate)
                ///GenericElements.AppUrlArea { anchors.fill: parent }
            }

            Item { height: 10; width: 1 }



            // Analysis - Modelling
            Row {
                id: buttons
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 5
                GenericToolbar.Button {
                    id: modellingButton
                    checked: true
                    autoExclusive: false
                    width: 0
                    font.pointSize: repeatFontSize
                    font.bold: true
                    text: ""
                    ToolTip.text: "Simulation of diffraction data"
                    onClicked: checked = true
                }
                GenericToolbar.Button { width: 1; opacity: 0 }
                GenericToolbar.Button {
                    id: analysisButton
                    checked: true
                    autoExclusive: false
                    width: 0
                    font.pointSize: repeatFontSize
                    font.bold: true
                    text: ""
                    ToolTip.text: "Fitting of diffraction data"
                    onClicked: {
                        dialog.close()
                        Generic.Variables.toolbarCurrentIndex = 0 }
                }

            }


        }


        // Repeat
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            Button {
                id: repeatButton
                text: "Repeat"
                contentItem: IconLabel {
                    text: repeatButton.text
                    font.family: Generic.Style.titleThinFontFamily
                    font.pointSize: repeatFontSize
                    color: "#666"
                }
                background: Rectangle {
                    color: "transparent"
                }
                onClicked: {
                    making.opacity = 0
                    diffraction.opacity = 0
                    dam.opacity = 0
                    easy.opacity = 0

                    easy.color = "#666"
                    diffraction.color = "#666"

                    easy.font.family = Generic.Style.titleThickFontFamily
                    diffraction.text = "diffraction"

                    making.x = 0
                    diffraction.x = making.width
                    dam.x = making.width + diffraction.width
                    easy.x = making.width + diffraction.width + dam.width

                    modellingButton.width = 0
                    analysisButton.width = 0
                    modellingButton.text = ""
                    analysisButton.text = ""

                    appIcon.opacity = 0
                    appVersion.opacity = 0

                    animo.restart()
                    //animo.start()
                }
            }


        }

        //standardButtons: Dialog.Ok

    }

    SequentialAnimation {
        id: animo
        running: true
        PauseAnimation {
            // initial delay
            //duration: 2*animationDuration
        }
        ParallelAnimation {
            // appearing
            NumberAnimation { easing.type: Easing.OutCubic; target: making;      property: "opacity"; to: 1; duration: 2*animationDuration }
            NumberAnimation { easing.type: Easing.OutCubic; target: diffraction; property: "opacity"; to: 1; duration: 2*animationDuration }
            NumberAnimation { easing.type: Easing.OutCubic; target: dam;         property: "opacity"; to: 1; duration: 2*animationDuration }
            NumberAnimation { easing.type: Easing.OutCubic; target: easy;        property: "opacity"; to: 1; duration: 2*animationDuration }
        }
        ParallelAnimation {
            // highlighting
            PropertyAnimation { target: easy;        property: "color"; to: "#444"; duration: animationDuration }
            PropertyAnimation { target: diffraction; property: "color"; to: "#444"; duration: animationDuration }
            // hidding
            NumberAnimation { target: making; property: "opacity"; to: 0; duration: animationDuration }
            NumberAnimation { target: dam;    property: "opacity"; to: 0; duration: animationDuration }
        }
        ParallelAnimation {
            // font change
            PropertyAnimation { target: easy; property: "font.family"; to: Generic.Style.titleThinFontFamily; duration: animationDuration*0.1 }
            // text change
            PropertyAnimation { target: diffraction; property: "text"; to: "Diffraction"; duration: animationDuration*0.1 }
            // mooving
            NumberAnimation { easing.type: Easing.OutExpo; target: easy;         property: "x"; to: container.width/2 - easy.width - (diffraction.width - easy.width)/2; duration: animationDuration }
            NumberAnimation { easing.type: Easing.OutExpo; target: diffraction;  property: "x"; to: container.width/2 - (diffraction.width - easy.width)/2; duration: animationDuration }
        }
        ParallelAnimation {
            // show app icon and version
            PropertyAnimation { easing.type: Easing.InExpo; target: appIcon;    property: "opacity"; to: 1; duration: animationDuration }
            PropertyAnimation { easing.type: Easing.InExpo; target: appVersion; property: "opacity"; to: 1; duration: animationDuration }
        }
        ParallelAnimation {
            // show buttons
            //PropertyAnimation { target: buttons; property: "visible"; to: true; duration: 0 }
            PropertyAnimation { target: modellingButton; property: "text"; to: "Modelling"; duration: animationDuration*0.29 }//animationDuration }
            PropertyAnimation { target: analysisButton;  property: "text"; to: "Analysis"; duration: animationDuration*0.29 } //animationDuration }
            PropertyAnimation { target: modellingButton; property: "width"; to: 150; duration: animationDuration*0.3 }//animationDuration }
            PropertyAnimation { target: analysisButton;  property: "width"; to: 150; duration: animationDuration*0.3 } //animationDuration }
        }
    }







    QtLabs.MenuBar {

        QtLabs.Menu {
            title: qsTr("&File")
            QtLabs.MenuItem {
                text: qsTr("&Open")
                onTriggered: messageDialog.show(qsTr("Open action triggered"))
            }

            QtLabs.MenuItem {
                text: qsTr("E&xit")
                onTriggered: Qt.quit()
            }
        }

        QtLabs.Menu {
            title: qsTr("&Help")
            QtLabs.MenuItem {
                text: qsTr("&Help")
                onTriggered: messageDialog.show(qsTr("Open action triggered"))
            }
            QtLabs.MenuItem {
                text: qsTr("Show Application Intro")
                checkable: true
                checked: Generic.Variables.showIntro
                onTriggered: Generic.Variables.showIntro = checked
            }
            QtLabs.MenuItem {
                text: qsTr("&Show User Guides")
                checkable: true
                checked: Generic.Variables.showGuide
                onTriggered: Generic.Variables.showGuide = checked
            }
            QtLabs.MenuItem {
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
        const xhr = new XMLHttpRequest()
        xhr.open("GET", "../Imports/easyAnalysis/DiffractionData/cecual.txt", false)
        xhr.send()

        // Extract columns from file
        Generic.Variables.xObs = GenericLogic.Parse.getColumn(xhr.responseText, 0, 1)
        Generic.Variables.yObs = GenericLogic.Parse.getColumn(xhr.responseText, 1, 1)
        Generic.Variables.syObs = GenericLogic.Parse.getColumn(xhr.responseText, 2, 1)
        Generic.Variables.yCalc = GenericLogic.Parse.getColumn(xhr.responseText, 3, 1)
        Generic.Variables.yPreCalc = GenericLogic.Parse.getColumn(xhr.responseText, 4, 1)
   }

}
