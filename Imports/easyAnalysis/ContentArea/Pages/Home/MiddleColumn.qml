import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 1.4 as Controls1
import easyAnalysis 1.0 as Generic
import easyAnalysis.Elements 1.0 as GenericElements
import easyAnalysis.ContentArea 1.0 as GenericContentArea

ColumnLayout {
    Layout.preferredWidth: 1
    Layout.alignment: Qt.AlignTop
    spacing: 20

    GenericContentArea.Button {
        Layout.fillWidth: true
        checked: true
        text: "Create New Project"
        icon.source: "../../../Icons/Notes.svg"
        ToolTip.text: qsTr("Create new project")
    }

    GenericContentArea.Button {
        Layout.fillWidth: true
        text: "Run Without Project"
        icon.source: "../../../Icons/TextFile.svg" // https://www.flaticon.com/free-icon/text-file_25642
        ToolTip.text: qsTr("Run without project")
    }

    GenericElements.HorizontalBorder {}

    GenericContentArea.Button {
        Layout.fillWidth: true
        text: "Open Existing Project"
        icon.source: "../../../Icons/Upload.svg" // https://www.flaticon.com/free-icon/upload_25635
        ToolTip.text: qsTr("Open existing project")
    }

    Text {
        Layout.fillWidth: true
        horizontalAlignment: Text.AlignHCenter
        text: "Open Recent Project"
        bottomPadding: -15
    }

    GenericElements.ParametersTable {
        Layout.fillWidth: true
        Layout.fillHeight: true
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

}
