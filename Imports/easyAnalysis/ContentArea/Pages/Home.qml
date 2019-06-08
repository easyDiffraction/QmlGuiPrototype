import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
//import QtQuick.Dialogs 1.3
import easyAnalysis 1.0 as Generic
import easyAnalysis.MainArea.Pages 1.0 as GenericMainAreaPages

GenericMainAreaPages.Home {}

/*
Dialog {
    visible: true
    modal: true
    title: "Blue sky dialog"

    Rectangle {
        color: "lightskyblue"
        implicitWidth: 400
        implicitHeight: 100
        Text {
            text: "Hello blue sky!"
            color: "navy"
            anchors.centerIn: parent
        }
    }
}

/*
ColumnLayout {
    property int animationDuration: 0
    //Layout.fillHeight: true
    //Layout.fillWidth: true
    //anchors.fill: parent
    //anchors.centerIn: parent
    //Layout.alignment: Qt.AlignCenter
    //width: parent.width
    //height: parent.height


    //color: "white"

    Rectangle {
        //Layout.alignment: Qt.AlignHCenter
        //Layout.fillWidth: true
        //width: 100
        height: 100
        color: "red"
    }

    Image {
        //Layout.alignment: Qt.AlignHCenter
        //anchors.horizontalCenter: parent.horizontalCenter
        width: 100
        fillMode: Image.PreserveAspectFit
        source: "../../Icons/App/App.svg"
        //AppUrlArea { anchors.fill: parent }
    }

    Rectangle {
        //Layout.fillWidth: true
        //Layout.alignment: Qt.AlignHCenter
        //anchors.horizontalCenter: parent.horizontalCenter
        ///anchors.centerIn: parent
        //height: diffraction.height
        width: making.width + diffraction.width + dam.width + easy.width

        color: "white"

        id: container

        Text { id: making;      text: "Making ";                        x: 0; font.family: Generic.Style.titleThinFontFamily; font.pointSize: 32; color: "#666" }
        //Text { id: making;      text: "";                        x: 0 }
        Text { id: diffraction; text: "Diffraction";                    x: making.width; font.family: Generic.Style.titleThickFontFamily; font.pointSize: 32; color: "#444" }
        Text { id: dam;         text: " data analysis and modeling ";   x: making.width + diffraction.width; font.family: Generic.Style.titleThinFontFamily; font.pointSize: 32; color: "#666" }
        //Text { id: dam;         text: "";   x: making.width + diffraction.width }
        Text { id: easy;        text: "easy";                           x: making.width + diffraction.width + dam.width; font.family: Generic.Style.titleThickFontFamily; font.pointSize: 32; color: "#444" }

        SequentialAnimation {
            id: animo
            //running: true
            // Pause
            PauseAnimation { duration: animationDuration }
            // Hidding
            ParallelAnimation {
                NumberAnimation { target: making;   property: "opacity"; to: 0; duration: 3*animationDuration }
                NumberAnimation { target: dam;      property: "opacity"; to: 0; duration: 3*animationDuration }
            }
            ParallelAnimation {
                // font change
                PropertyAnimation { target: easy; property: "font.family"; to: Generic.Style.titleThinFontFamily; duration: 0 }
                // mooving
                NumberAnimation { target: easy;         property: "x"; to: container.width/2 - easy.width - (diffraction.width - easy.width)/2; duration: animationDuration }
                NumberAnimation { target: diffraction;  property: "x"; to: container.width/2 - (diffraction.width - easy.width)/2; duration: animationDuration }
            }
        }

    }



    Component.onCompleted: {
        animo.start()
    }

}



/*
    Rectangle {
        //anchors.fill: parent
        anchors.centerIn: parent

        id: container


        Text {
            id: diffraction
            //anchors.left: container.right
            text: "diffraction "
        }


        Text {
            id: easy
            anchors.left: diffraction.right
            text: " easier"
        }



        states: State {
            name: "reanchored"
            AnchorChanges { target: easy; anchors.left: container.left }
            //AnchorChanges { target: easy; anchors.right: container.horizontalCenter }
            //AnchorChanges { target: diffraction; anchors.left: container.horizontalCenter }
        }

        transitions: Transition {
            // smoothly reanchor myRect and move into new position
            AnchorAnimation { duration: animationDuration }
        }

        //Component.onCompleted: container.state = "reanchored"

}
*/



