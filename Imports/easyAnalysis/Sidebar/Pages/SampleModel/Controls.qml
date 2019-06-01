import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls 1.4 as Controls1
import QtQuick.Layouts 1.12
import easyAnalysis 1.0 as Generic
import easyAnalysis.Elements 1.0 as GenericElements
import easyAnalysis.ContentArea.Buttons 1.0 as GenericContentAreaButtons

Column {
    anchors.fill: parent

    ///////////
    // Groupbox
    ///////////
    GenericElements.GroupBox {
        title: "Unit cell parameters"
        //collapsed: false
        content: ColumnLayout {
            spacing: 10
            GenericElements.ParametersTable {
                visibleRowsCount: 1
                model: ListModel {
                    ListElement { a:"4.256782"; b:"4.256782"; c:"10.633879"; alpha:"90.0"; beta:"90.0"; gamma:"90.0" }
                }
                Controls1.TableViewColumn { role:"a";       title:"a (\u212B)" }
                Controls1.TableViewColumn { role:"b";       title:"b (\u212B)" }
                Controls1.TableViewColumn { role:"c";       title:"c (\u212B)"  }
                Controls1.TableViewColumn { role:"alpha";   title:"alpha (°)"  }
                Controls1.TableViewColumn { role:"beta";    title:"beta (°)"  }
                Controls1.TableViewColumn { role:"gamma";   title:"gamma (°)" }
            }
        }
    }

    ///////////
    // Groupbox
    ///////////
    GenericElements.GroupBox {
        title: "Atoms, atomic coordinates and occupations"
        content: ColumnLayout {
            spacing: 10
            GenericElements.ParametersTable {
                model: ListModel {
                    ListElement { num:"1"; label:" Ce1"; atom:"Ce"; color:"#408002"; x:"0.00000"; y:"0.00000"; z:"0.00000"; occ:"1.00000"; btype:"remove" }
                    ListElement { num:"2"; label:" Cu1"; atom:"Cu"; color:"#0F80FF"; x:"0.00000"; y:"0.00000"; z:"0.63224"; occ:"0.92491"; btype:"remove" }
                    ListElement { num:"3"; label:" Al1"; atom:"Al"; color:"#FC6666"; x:"0.00000"; y:"0.00000"; z:"0.63224"; occ:"0.07509"; btype:"remove" }
                    ListElement { num:"4"; label:" Cu2"; atom:"Cu"; color:"#0F80FF"; x:"0.00000"; y:"0.00000"; z:"0.40437"; occ:"0.04446"; btype:"remove" }
                    ListElement { num:"5"; label:" Al2"; atom:"Al"; color:"#FC6666"; x:"0.00000"; y:"0.00000"; z:"0.40437"; occ:"0.95553"; btype:"remove" }
                    ListElement { num:"6"; label:" Al3"; atom:"Al"; color:"#FC6666"; x:"0.00000"; y:"0.50000"; z:"0.24981"; occ:"1.00000"; btype:"remove" }
                }
                Controls1.TableViewColumn { role:"num";     title:"No.";    resizable: false }
                Controls1.TableViewColumn { role:"label";   title:"Label";  resizable: false }
                Controls1.TableViewColumn { role:"atom";    title:"Atom";   resizable: false }
                Controls1.TableViewColumn { role:"color";   title:"Color";  resizable: false; delegate: GenericElements.ColoredCell { cellColor: styleData.value } }
                Controls1.TableViewColumn { role:"x";       title:"x" }
                Controls1.TableViewColumn { role:"y";       title:"y" }
                Controls1.TableViewColumn { role:"z";       title:"z" }
                Controls1.TableViewColumn { role:"occ";     title:"Occ" }
                Controls1.TableViewColumn { delegate: GenericContentAreaButtons.Remove {} }
            }
        }
    }

    ///////////
    // Groupbox
    ///////////
    GenericElements.GroupBox {
        title: "Atomic displacement parameters (\u200A\u00D7\u200A10\u2075\u200A)"
        content: ColumnLayout {
            GenericElements.ParametersTable {
                model: ListModel {
                    ListElement { num:"1"; label:"Ce1"; type:1; uiso:"";    u11:"570"; u22:"570"; u33:"620"; u12:"-10"; u13:"20";  u23:"130" }
                    ListElement { num:"2"; label:"Cu1"; type:0; uiso:"830"; u11:"";    u22:"";    u33:"";    u12:"";    u13:"";    u23:""    }
                    ListElement { num:"3"; label:"Al1"; type:0; uiso:"830"; u11:"";    u22:"";    u33:"";    u12:"";    u13:"";    u23:""    }
                    ListElement { num:"4"; label:"Cu2"; type:1; uiso:"";    u11:"570"; u22:"570"; u33:"620"; u12:"-10"; u13:"20";  u23:"130" }
                    ListElement { num:"5"; label:"Al2"; type:1; uiso:"";    u11:"570"; u22:"570"; u33:"620"; u12:"-10"; u13:"20";  u23:"130" }
                    ListElement { num:"6"; label:"Al3"; type:1; uiso:"";    u11:"570"; u22:"570"; u33:"620"; u12:"-10"; u13:"20";  u23:"130" }
                }
                Controls1.TableViewColumn { role:"num";     title:"No.";    resizable: false }
                Controls1.TableViewColumn { role:"label";   title:"Label";  resizable: false }
                Controls1.TableViewColumn { role:"type";    title:"Type";   resizable: false; delegate: GenericElements.TransparentComboBox { currentIndex: styleData.value; model: ["iso", "aniso"] } }
                Controls1.TableViewColumn { role:"uiso";    title:"Uiso" }
                Controls1.TableViewColumn { role:"u11";     title:"U11" }
                Controls1.TableViewColumn { role:"u22";     title:"U22" }
                Controls1.TableViewColumn { role:"u33";     title:"U33" }
                Controls1.TableViewColumn { role:"u12";     title:"U12" }
                Controls1.TableViewColumn { role:"u13";     title:"U13" }
                Controls1.TableViewColumn { role:"u23";     title:"U23" }
            }
        }
    }

}


