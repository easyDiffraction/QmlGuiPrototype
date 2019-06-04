import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import easyAnalysis 1.0 as Generic

Column {
    Layout.fillWidth: true
    spacing: 10

    Image {
        anchors.horizontalCenter: parent.horizontalCenter
        width: 100
        fillMode: Image.PreserveAspectFit
        source: "../../../Icons/App/App.svg"
        AppUrlArea { anchors.fill: parent }
    }

    RowLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 0

        Text {
            font.family: Generic.Style.titleThinFontFamily
            font.pointSize: 32
            text: Generic.Style.appLeftName
            color: "black"
            AppUrlArea { anchors.fill: parent }
        }

        Text {
            font.family: Generic.Style.titleThickFontFamily
            font.pointSize: 32
            text: Generic.Style.appRightName
            color: "#444"
            AppUrlArea { anchors.fill: parent }
        }
    }

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: Generic.Style.versionFontFamily
        font.pointSize: 13
        text: "Version %1 (%2)".arg(Generic.Style.appVersion).arg(Generic.Style.appDate)
        AppUrlArea { anchors.fill: parent }
    }

}
