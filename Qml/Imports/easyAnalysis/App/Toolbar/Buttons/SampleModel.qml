import QtQuick 2.12
import QtQuick.Controls 2.12
import easyAnalysis 1.0 as Generic
import easyAnalysis.App.Toolbar 1.0 as GenericAppToolbar

GenericAppToolbar.Button {
    icon.source: Generic.Variables.iconsPath + "Diamond.svg" //https://www.flaticon.com/free-icon/diamond_59993#term=diamond&page=1&position=34
    //icon.source: "../../Icons/Stone.svg" // https://www.iconfinder.com/icons/2730260/harry_philosophers_potter_rock_solid_stone_icon
    text: qsTr("Sample Model")
    ToolTip.text: qsTr("Sample model description page")
    //finished: Generic.Variables.samplePageFinished
}
