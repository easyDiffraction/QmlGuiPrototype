import QtQuick 2.12
import QtQuick.Controls 2.12
import easyAnalysis 1.0 as Generic
import easyAnalysis.App.Toolbar 1.0 as GenericAppToolbar

GenericAppToolbar.Button {
    icon.source: Generic.Variables.iconsPath + "Home.svg" // https://www.iconfinder.com/icons/1608930/home_icon
    text: qsTr("Home")
    ToolTip.text: qsTr("Home page")
    //finished: Generic.Variables.homePageFinished
}


