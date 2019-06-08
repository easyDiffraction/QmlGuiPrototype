import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import easyAnalysis.MainArea.Pages.Home 1.0 as GenericHomePage

Item {
    //width: parent.width
    //Layout.fillWidth: true
    //Layout.fillHeight: true




    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 30
        //width: parent.width
        //anchors.verticalCenter: parent.verticalCenter
        spacing: 30


        Item { Layout.fillHeight: true }

        //Item { height: 50 }
        //Rectangle { height: 50; width: 30; color: "red" }
        //Rectangle { height: 20; width: 130; color: "green" }
        //Rectangle { height: 50; width: 80; color: "blue" }
///        GenericHomePage.AppInfo {}

        RowLayout {
            Layout.fillWidth: true
            //Layout.alignment: Qt.AlignTop
            //width: parent.width
            //anchors.margins: 50
            //anchors.horizontalCenter: parent.horizontalCenter
            //anchors.fill: parent
            //anchors.verticalCenter: parent.verticalCenter
            //anchors.top: parent.top - 50

            spacing: 30
            GenericHomePage.LeftColumn {}
            GenericHomePage.MiddleColumn {}
            GenericHomePage.RightColumn {}

        }

        Item { Layout.fillHeight: true }

    }

}

/*
Column {
    property int columWidth: 400

    //color: "transparent"
    anchors.fill: parent
    anchors.topMargin: 50
    spacing: 5

    Image {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 0
        width: 100
        fillMode: Image.PreserveAspectFit
        source: "../../Resources/Icons/App/App.svg"
    }

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        text: "easyReflectometry"
        font.family: titleFont.name
        font.pointSize: 32
    }

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Version 0.2.3 (30 Apr 2019)"
        //font.family: titleFont.name
        font.family: versionFont.name
        font.pointSize: 13
        color: "dimgray"
    }

    Item { width: 1; height: 50 }

    Row {
        anchors.horizontalCenter: parent.horizontalCenter
        //anchors.fill: parent
        //anchors.verticalCenter: parent.verticalCenter
        //anchors.top: parent.top - 50

        spacing: 50

        ////////////
        Column {
            //anchors.horizontalCenter: parent.horizontalCenter
            //anchors.verticalCenter: parent.verticalCenter
            width: columWidth
            spacing: 20

            AsElements.SidebarButton {
                width: parent.width
                text: "Online Help"
                icon.source: "../../Resources/Icons/Question.svg"
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Get online help for this page")
            }

            //AsElements.SidebarButton {
            //    width: parent.width
            //    text: "Online Tutorials"
            //    icon.source: "../../Resources/Icons/Education.svg"
            //}

            AsElements.SidebarButton {
                width: parent.width
                text: "Report Bug"
                icon.source: "../../Resources/Icons/Bug.svg"
            }

        }

        ////////////
        Column {
            //anchors.horizontalCenter: parent.horizontalCenter
            //anchors.verticalCenter: parent.verticalCenter
            width: columWidth
            spacing: 20

            AsElements.SidebarButton {
                width: parent.width
                text: "Create New Project"
                buttonType: "highlight"
                icon.source: "../../Resources/Icons/Notes.svg"
                onClicked: {
                    fileDialog.open()
                }
            }

            AsElements.SidebarButton {
                width: parent.width
                text: "Run Without Project"
                icon.source: "../../Resources/Icons/Button_Open-File.svg"
                onClicked: {
                    dataPageFinished = true
                    samplePageFinished = true
                    instrumentPageFinished = true
                    messageDialogWithoutProject.open()
                }
            }

            FileDialog {
                id: fileDialog
                selectExisting: false
                //folder: StandardPaths.writableLocation(StandardPaths.DocumentsLocation)
                onAccepted: {
                    dataPageFinished = true
                    samplePageFinished = true
                    instrumentPageFinished = true
                    messageDialogCreateProject.open()
                }
            }



            Rectangle {
                width: parent.width
                height: 1
                color: "gainsboro"
            }

            AsElements.SidebarButton {
                width: parent.width
                text: "Open Existing Project"
                icon.source: "../../Resources/Icons/Upload.svg"
            }

            Text {
                width: parent.width
                text: "Open Recent Project"
                horizontalAlignment: Text.AlignHCenter
                bottomPadding: -15
            }

            AsWidgets.ParametersTable {
                width: parent.width
                height: 225
                //headerRowColor: "#f5f5f5"
                model: ListModel {
                    ListElement { number:"1"; name:"SiO_experiment"; path:"~/Exp/ESS/2019-03/"; cdate:"11.04.2019" }
                    ListElement { number:"2"; name:"Simulation_test"; path:"~/Exp/ESS/2019-02/"; cdate:"02.04.2019" }
                    ListElement { number:"3"; name:"Fitting_test"; path:"~/Exp/ESS/2018-11/"; cdate:"15.03.2019" }
                    ListElement { number:"4"; name:"Neutron_custom"; path:"~/Exp/ILL/2018-10/"; cdate:"08.03.2019" }
                    ListElement { number:"5"; name:"SiO_test"; path:"~/Exp/ESS/2018-07/"; cdate:"07.02.2019" }
                    ListElement { number:"6"; name:"First_test"; path:"~/Exp/ESS/2018-07/"; cdate:"03.02.2019" }
                    ListElement { number:"7"; name:"X-ray_custom"; path:"~/Exp/ESRF/2016-03/"; cdate:"01.02.2019" }
                }
                TableViewColumn { title:"No."; role:"number"; width: 40; horizontalAlignment:Text.AlignHCenter }
                TableViewColumn { title:"Name"; role:"name"; width: 115; horizontalAlignment:Text.AlignLeft }
                TableViewColumn { title:"Path"; role:"path"; width: 150; horizontalAlignment:Text.AlignLeft }
                TableViewColumn { title:"Creation date"; role:"cdate"; width: 80; horizontalAlignment:Text.AlignLeft }
            }

        }

        ////////////
        Column {
            //anchors.horizontalCenter: parent.horizontalCenter
            //anchors.verticalCenter: parent.verticalCenter
            width: columWidth
            spacing: 20

            //AsElements.SidebarButton {
            //    width: parent.width
            //    text: "Save Current State"
            //    icon.source: "../../Resources/Icons/Save.svg"
            //}

            AsElements.SidebarButton {
                width: parent.width
                enabled: dataPageFinished
                text: "Save Project As..."
                icon.source: "../../Resources/Icons/Download.svg"
            }

        }





    }

}
*/
