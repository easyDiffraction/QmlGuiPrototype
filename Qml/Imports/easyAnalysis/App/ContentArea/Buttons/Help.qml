import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import easyAnalysis 1.0 as Generic
import easyAnalysis.App.ContentArea 1.0 as GenericAppContentArea

GenericAppContentArea.Button {
    icon.source: Generic.Variables.iconsPath + "Question.svg" // https://www.flaticon.com/free-icon/question-mark-on-a-circular-black-background_25400
    ToolTip.text: qsTr("Get online help for this page")
}


