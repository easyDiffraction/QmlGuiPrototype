import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import easyAnalysis.Elements 1.0 as GenericElements

Column {
    anchors.fill: parent

    // Groupbox
    GenericElements.GroupBox {
        title: "View"

        content: ColumnLayout {
            spacing: 0

            // Set column widths
            Rectangle { width: 20; height: 0}
            Rectangle { Layout.fillWidth: true; height: 0}

            // Row
            GenericElements.CheckBox {
                checked: true
                text: qsTr("Show layers' names")
            }
        }
    }

}





/*
GenericElements.SidebarStack {
    content: [


        // Controls
        Column {
             spacing: 0

             // Groupbox
             GenericElements.GroupBox {
                 title: "View"
                 collapsed: false
                 //showBorder: false
                 content: ColumnLayout {
                     spacing: 0

                     // Set column widths
                     Rectangle { width: 20; height: 0}
                     Rectangle { Layout.fillWidth: true; height: 0}

                     // Row
                     GenericElements.CheckBox {
                         checked: true
                         text: qsTr("Show layers' names")
                     }
                 }
             }
        }


        ,


        // Settings
        Column {
             spacing: 0

             // Groupbox
             GenericElements.GroupBox {
                 title: "View"
                 collapsed: false
                 //showBorder: false
                 content: ColumnLayout {
                     spacing: 0

                     // Set column widths
                     Rectangle { width: 20; height: 0}
                     Rectangle { Layout.fillWidth: true; height: 0}

                     // Row
                     GenericElements.CheckBox {
                         checked: true
                         text: qsTr("Show layers' names")
                     }
                 }
             }
        }


    ]
}





/*

AsWidgets.SidebarStack {
    content: [

        // Controls
        ColumnLayout {
            //anchors.fill: parent
             spacing: 0

             // Groupbox
             AsWidgets.CollapsibleGroupBox {
                 Layout.fillWidth: true
                 title: "Import/Export"
                 collapsed: false
                 //showBorder: false
                 content: ColumnLayout {
                     spacing: 10

                     RowLayout {
                         spacing: 10
                         AsElements.SidebarButton { text: "Import sample model"; icon.source: "../../Resources/Icons/Upload.svg" }
                         AsElements.SidebarButton { text: "Export sample model"; icon.source: "../../Resources/Icons/Download.svg" }
                     }

                 }
             }

             // Groupbox
             AsWidgets.CollapsibleGroupBox {
                 Layout.fillWidth: true
                 title: "Layers"
                 collapsed: false
                 //showBorder: false
                 content: ColumnLayout {
                     spacing: 10
                     AsWidgets.ParametersTable {
                         Layout.fillWidth: true
                         implicitHeight: 193

                         model: ListModel {
                             ListElement { num:"0"; layer:"Air"; color:"honeydew"; sldre:"0.00"; sldim:"0.00"; thickness:"0.0"; roughness:"0.0" }
                             ListElement { num:"1"; layer:"TypeA"; color:"lightpink"; sldre:"1.00"; sldim:"0.01"; thickness:"2.5"; roughness:"1.0" }
                             ListElement { num:"2"; layer:"TypeB"; color:"powderblue"; sldre:"2.07"; sldim:"0.00"; thickness:"5.0"; roughness:"1.0" }
                             ListElement { num:"3"; layer:"TypeA"; color:"lightpink"; sldre:"1.00"; sldim:"0.01"; thickness:"2.5"; roughness:"1.0" }
                             ListElement { num:"4"; layer:"TypeB"; color:"powderblue"; sldre:"2.07"; sldim:"0.00"; thickness:"5.0"; roughness:"1.0" }
                             ListElement { num:"5"; layer:"TypeA"; color:"lightpink"; sldre:"1.00"; sldim:"0.01"; thickness:"2.5"; roughness:"1.0" }
                             ListElement { num:"6"; layer:"TypeB"; color:"powderblue"; sldre:"2.07"; sldim:"0.00"; thickness:"5.0"; roughness:"1.0" }
                             ListElement { num:"7"; layer:"TypeA"; color:"lightpink"; sldre:"1.00"; sldim:"0.01"; thickness:"2.5"; roughness:"1.0" }
                             ListElement { num:"8"; layer:"TypeB"; color:"powderblue"; sldre:"2.07"; sldim:"0.00"; thickness:"5.0"; roughness:"1.0" }
                             ListElement { num:"9"; layer:"TypeA"; color:"lightpink"; sldre:"1.00"; sldim:"0.01"; thickness:"2.5"; roughness:"1.0" }
                             ListElement { num:"10"; layer:"TypeB"; color:"powderblue"; sldre:"2.07"; sldim:"0.00"; thickness:"5.0"; roughness:"1.0" }
                             ListElement { num:"11"; layer:"Substrate"; color:"wheat"; sldre:"0.00"; sldim:"0.00"; thickness:"0.0"; roughness:"0.0" }
                         }
                         TableViewColumn { role:"num"; title:"No."; width:parent.width/14; horizontalAlignment:Text.AlignHCenter }
                         TableViewColumn { role:"layer"; title:"Layer"; width:parent.width/7; horizontalAlignment:Text.AlignLeft }
                         TableViewColumn { role:"color"; title:"Color"; width:parent.width/14; horizontalAlignment:Text.AlignHCenter; delegate: Rectangle { y: 1; color: styleData.value } }
                         TableViewColumn { role:"sldre"; title:"SLD Re"; width:parent.width/9; horizontalAlignment:Text.AlignRight }
                         TableViewColumn { role:"sldim"; title:"SLD Im"; width:parent.width/9; horizontalAlignment:Text.AlignRight }
                         TableViewColumn { role:"thickness"; title:"Thickness"; width:parent.width/7; horizontalAlignment:Text.AlignRight }
                         TableViewColumn { role:"roughness"; title:"Roughness"; width:parent.width/7; horizontalAlignment:Text.AlignRight }
                         //TableViewColumn { width:100; delegate:Rectangle { color:"transparent"; AsElements.SidebarButton { anchors.horizontalCenter:parent.horizontalCenter; anchors.verticalCenter:parent.verticalCenter; height:30; width:70; text:"Remove" } } }
                         TableViewColumn { width:75; delegate:Rectangle { color:"transparent"; AsElements.SidebarButton { anchors.horizontalCenter:parent.horizontalCenter; anchors.verticalCenter:parent.verticalCenter; height:30; width:30; buttonType: "remove" } } }
                     }

                     RowLayout {
                         spacing: 10
                         AsElements.SidebarButton { text: "Add new layer"; buttonType: "add" }
                         Item { width: 3 }
                         AsElements.TextField { placeholderText: "10"; implicitWidth: 55; horizontalAlignment: Text.AlignRight }
                         TextArea { text: "times"; implicitWidth: 55; horizontalAlignment: Text.AlignLeft }
                     }

                     RowLayout {
                         spacing: 10
                         AsElements.SidebarButton { text: "Copy selected row(s)"; buttonType: "copy" }
                         Item { width: 3 }
                         AsElements.TextField { placeholderText: "10"; implicitWidth: 55; horizontalAlignment: Text.AlignRight }
                         TextArea { text: "times"; implicitWidth: 55; horizontalAlignment: Text.AlignLeft }
                     }

                     RowLayout {
                         spacing: 10
                         AsElements.SidebarButton { text: "Clone selected row(s)"; buttonType: "copy"; ToolTip.text: qsTr("Copy selected row(s) and automatically create constraints between them"); ToolTip.visible: hovered }
                         Item { width: 3 }
                         AsElements.TextField { placeholderText: "10"; implicitWidth: 55; horizontalAlignment: Text.AlignRight }
                         TextArea { text: "times"; implicitWidth: 55; horizontalAlignment: Text.AlignLeft }
                     }



                 }
             }

             // Spacer
             Item { Layout.fillHeight: true }

             // Groupbox
             AsWidgets.UntitledGroupBox {
                 showBorder: false
                 content: RowLayout {
                     spacing: 10
                     AsElements.GoNextButton {
                         text: "Next step: Instrument Model"
                         ToolTip.text: qsTr("Go to the next step: Instrument Model description")
                         onClicked: {
                             instrumentDescribed = true
                             if (sampleDescribed && instrumentDescribed)
                                 bindButtonEnabled = true
                             mainCurrentIndex = 3
                         }
                     }
                     AsElements.HelpButton {}
                     AsElements.SaveStateButton {}
                 }
             }

        }

        ,

        // Settings
        Column {
             spacing: 0

             // Groupbox
             AsWidgets.CollapsibleGroupBox {
                 title: "View"
                 collapsed: false
                 showBorder: false
                 content: ColumnLayout {
                     spacing: 0

                     // Set column widths
                     Rectangle { width: 20; height: 0}
                     Rectangle { Layout.fillWidth: true; height: 0}

                     // Row
                     AsElements.CheckBox {
                         checked: true
                         text: qsTr("Show layers' names")
                     }
                 }
             }
        }

    ]
}

*/
