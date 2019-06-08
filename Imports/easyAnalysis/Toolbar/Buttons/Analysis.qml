import QtQuick 2.12
import QtQuick.Controls 2.12
import easyAnalysis 1.0 as Generic
import easyAnalysis.Toolbar 1.0 as GenericToolbar

GenericToolbar.Button {
    icon.source: "../../Icons/Fitting.svg"
    text: qsTr("Analysis")
    ToolTip.text: qsTr("Analysis and modeling page")
    //finished: Generic.Variables.analysisPageFinished
}
