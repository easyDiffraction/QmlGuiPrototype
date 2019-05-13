import QtQuick 2.12
import QtQuick.Controls 2.12
import easyAnalysis.Toolbar 1.0 as GenericToolbar

GenericToolbar.Button {
    icon.source: "../../Icons/Report.svg" // https://www.onlinewebfonts.com/icon/296476
    text: qsTr("Summary")
    ToolTip.text: qsTr("Summary page of the work done")
}
