import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import easyAnalysis 1.0 as Generic
import easyAnalysis.App.ContentArea 1.0 as GenericAppContentArea

//import easyAnalysis.Icons 1.0 as GenericIcons
//import easyAnalysis.Icons 1.0 as GenericIcons

ColumnLayout {
    //Layout.fillWidth: true
    Layout.alignment: Qt.AlignTop
    Layout.preferredWidth: 1
    spacing: 20



    GenericAppContentArea.Button {
        Layout.fillWidth: true
        //width: parent.width
        text: "Online Help"
        //icon.source: "../../../Icons/Question.svg" // https://www.flaticon.com/free-icon/question-mark-on-a-circular-black-background_25400
        ///icon.source: "https://raw.githubusercontent.com/easyDiffraction/QmlGuiPrototype/master/Imports/easyAnalysis/Icons/Bug.svg"
        icon.source: Generic.Variables.iconsPath + "Question.svg"
        ToolTip.text: qsTr("Get online help for this page")
    }

    GenericAppContentArea.Button {
        Layout.fillWidth: true
        //width: parent.width
        text: "Report Bug"
        //icon.source: "../../../Icons/Bug.svg" // https://www.iconfinder.com/icons/3671718/bug_icon
        ///icon.source: "relative:///Imports/easyAnalysis/Icons/Bug.svg" // https://www.iconfinder.com/icons/3671718/bug_icon
        icon.source: Generic.Variables.iconsPath + "Bug.svg"
        ToolTip.text: qsTr("Report a bug in the issue tracker")

        //Component.onCompleted: {
        //    console.log("---2", Generic.Variables.iconsPath)
        //    console.log("---3", icon.source)
        //}
    }


}
