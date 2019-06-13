import QtQuick 2.12
import QtQuick.Controls 2.12
import easyAnalysis 1.0 as Generic
import easyAnalysis.App.Toolbar 1.0 as GenericAppToolbar

GenericAppToolbar.Button {
    icon.source: Generic.Variables.iconsPath + "Microscope.svg" // https://www.flaticon.com/free-icon/microscope_65896
    text: qsTr("Instrument Model")
    ToolTip.text: qsTr("Instrument model description page")
    //finished: Generic.Variables.instrumentPageFinished
}