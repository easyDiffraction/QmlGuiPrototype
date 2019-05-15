import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import easyAnalysis 1.0 as Generic
import easyAnalysis.ContentArea 1.0 as GenericContentArea

ColumnLayout {
    //Layout.fillWidth: true
    Layout.alignment: Qt.AlignTop
    Layout.preferredWidth: 1
    spacing: 20

    GenericContentArea.Button {
        Layout.fillWidth: true
        //width: parent.width
        text: "Online Help"
        icon.source: "../../../Icons/Question.svg" // https://www.iconfinder.com/icons/3671842/question_icon
        ToolTip.text: qsTr("Get online help for this page")
    }

    GenericContentArea.Button {
        Layout.fillWidth: true
        //width: parent.width
        text: "Report Bug"
        icon.source: "../../../Icons/Bug.svg" // https://www.iconfinder.com/icons/3671718/bug_icon
        ToolTip.text: qsTr("Report a bug in the issue tracker")
    }


}
