import QtQuick 2.12
import QtQuick.Controls 2.12
import easyAnalysis 1.0 as Generic
import easyAnalysis.App.Toolbar 1.0 as GenericAppToolbar

GenericAppToolbar.Button {
    icon.source: Generic.Variables.thirdPartyIconsPath + "link.svg"
    text: qsTr("Linking")
    ToolTip.text: qsTr("Table of jobs for analysis and modelling: Linked data-sample-instrument")
    //finished: Generic.Variables.linkingPageFinished
}


