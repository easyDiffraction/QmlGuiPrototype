import QtQuick 2.12
import QtQuick.Controls 2.12
import easyAnalysis 1.0 as Generic
import easyAnalysis.Toolbar 1.0 as GenericToolbar

GenericToolbar.Button {
    icon.source: "../../Icons/Home.svg" // https://www.iconfinder.com/icons/1608930/home_icon
    text: qsTr("Home")
    ToolTip.text: qsTr("Home page")
    //finished: Generic.Variables.homePageFinished
}


