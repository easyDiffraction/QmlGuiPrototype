import QtQuick 2.12
import QtQuick.Layouts 1.12
import easyAnalysis 1.0 as Generic
import easyDiffraction 1.0 as Specific

Rectangle {
    Layout.fillWidth: true
    Layout.fillHeight: true

    color: Generic.Style.appBkgColor

    Column {
        anchors.centerIn: parent
        spacing: 20

        Text { text: "CeCuAl3"; font.pointSize: Generic.Style.fontPointSize * 3; font.family: Generic.Style.fontFamily }
        Text { text: "Project description goes here. Project description goes here. Project description goes here."; font.pointSize: Generic.Style.fontPointSize + 1; font.family: Generic.Style.fontFamily }

        Row {
            spacing: 20

            Repeater {
                model: ["structure", "refinement"]

                Rectangle {
                    height: 200
                    width: height
                    color: "white"
                    border.color: Generic.Style.appBorderColor
                    Image {
                        anchors.fill: parent
                        anchors.margins: 10
                        fillMode: Image.PreserveAspectFit
                        clip: true
                        antialiasing: true
                        smooth: true
                        source: Specific.Variables.resourcesPath + "Examples/CeCuAl3_POLARIS/cecual_" + modelData + ".png"
                    }
                }
            }
        }

        Item { height: Generic.Style.fontPointSize * 3; width: 1 }
    }
}



