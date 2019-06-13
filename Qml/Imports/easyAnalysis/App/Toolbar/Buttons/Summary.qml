import QtQuick 2.12
import QtQuick.Controls 2.12
import easyAnalysis 1.0 as Generic
import easyAnalysis.App.Toolbar 1.0 as GenericAppToolbar

GenericAppToolbar.Button {
    icon.source: Generic.Variables.iconsPath + "Report.svg" // https://www.onlinewebfonts.com/icon/296476
    //icon.source: "../../Icons/Clipboard.svg" // https://www.flaticon.com/free-icon/clipboard-with-pencil_65251
    text: qsTr("Summary")
    ToolTip.text: qsTr("Summary page of the work done")
    //finished: Generic.Variables.summaryPageFinished
}