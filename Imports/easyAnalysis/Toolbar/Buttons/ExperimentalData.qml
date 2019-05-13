import QtQuick 2.12
import QtQuick.Controls 2.12
import easyAnalysis.Toolbar 1.0 as GenericToolbar

GenericToolbar.Button {
    icon.source: "../../Icons/Storage.svg" // https://www.iconfinder.com/icons/352145/storage_icon
    text: qsTr("Experimental Data") // Measured data?
    ToolTip.text: qsTr("Experimental data page")
}
