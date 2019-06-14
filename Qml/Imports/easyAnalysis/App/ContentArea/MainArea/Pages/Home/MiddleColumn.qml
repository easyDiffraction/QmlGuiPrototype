import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 1.4 as Controls1
import easyAnalysis 1.0 as Generic
import easyAnalysis.App.Elements 1.0 as GenericAppElements
import easyAnalysis.App.ContentArea 1.0 as GenericAppContentArea
import easyAnalysis.App.ContentArea.Buttons 1.0 as GenericAppContentAreaButtons
import easyAnalysis.Logic 1.0 as GenericLogic

ColumnLayout {

    Layout.preferredWidth: 1
    Layout.alignment: Qt.AlignTop
    spacing: 20

    GenericAppContentArea.Button {
        //id: openExampleButton
        Layout.fillWidth: true
        //highlighted: true
        text: "Create New Project"
        icon.source: Generic.Variables.iconsPath + "Notes.svg"
        ToolTip.text: qsTr("Create new project")
    }

    GenericAppContentArea.Button {
        Layout.fillWidth: true
        text: "Run Without Creating Project"
        icon.source: Generic.Variables.iconsPath + "TextFile.svg" // https://www.flaticon.com/free-icon/text-file_25642
        ToolTip.text: qsTr("Run without project")
    }

    GenericAppElements.HorizontalBorder {}

    GenericAppContentArea.Button {
        id: openExampleButton
        Layout.fillWidth: true
        text: "Open Example Project"
        highlighted: true
        icon.source: Generic.Variables.iconsPath + "Fitting.svg"
        ToolTip.text: qsTr("Open example project")
        onClicked: {
            Generic.Variables.homePageFinished = true
            Generic.Variables.toolbarCurrentIndex = Generic.Variables.ExperimentalDataIndex
        }
    }

    GenericAppContentArea.Button {
        Layout.fillWidth: true
        text: "Open Previously Saved Project"
        icon.source: Generic.Variables.iconsPath + "Upload.svg" // https://www.flaticon.com/free-icon/upload_25635
        ToolTip.text: qsTr("Open previously saved project")
    }

    Text {
        Layout.fillWidth: true
        horizontalAlignment: Text.AlignHCenter
        text: "Open Recent Project"
        bottomPadding: -15
    }

    GenericAppElements.ParametersTable {
        Layout.fillWidth: true
        //Layout.fillHeight: true
        model: ListModel {
            ListElement { number:"1"; name:"SiO_experiment";  path:"~/Exp/ESS/2019-03/";  cdate:"11.04.2019" }
            ListElement { number:"2"; name:"Simulation_test"; path:"~/Exp/ESS/2019-02/";  cdate:"02.04.2019" }
            ListElement { number:"3"; name:"Fitting_test";    path:"~/Exp/ESS/2018-11/";  cdate:"15.03.2019" }
            ListElement { number:"4"; name:"Neutron_custom";  path:"~/Exp/ILL/2018-10/";  cdate:"08.03.2019" }
            ListElement { number:"5"; name:"SiO_test";        path:"~/Exp/ESS/2018-07/";  cdate:"07.02.2019" }
            ListElement { number:"6"; name:"First_test";      path:"~/Exp/ESS/2018-07/";  cdate:"03.02.2019" }
            ListElement { number:"7"; name:"X-ray_custom";    path:"~/Exp/ESRF/2016-03/"; cdate:"01.02.2019" }
        }
        Controls1.TableViewColumn { title:"No.";            role:"number" }
        Controls1.TableViewColumn { title:"Name";           role:"name"  }
        Controls1.TableViewColumn { title:"Path";           role:"path" }
        Controls1.TableViewColumn { title:"Creation date";  role:"cdate" }
    }

    GenericAppElements.GuideWindow {
        id: guidWindow
        //message: "Click here to create a new project."
        message: "Click here to open an example project."
        toY: openExampleButton.y + openExampleButton.height/2

        visible: Generic.Variables.showGuide && Generic.Variables.toolbarCurrentIndex === Generic.Variables.HomeIndex ? true : false

        GenericAppContentArea.Button {
            id: openExampleButtonClone
            //onClicked: Generic.Variables.toolbarCurrentIndex = Generic.Variables.ExperimentalDataIndex
        }
        Component.onCompleted: {
            GenericLogic.Copy.copyButton(openExampleButton, openExampleButtonClone)
        }
    }

}
