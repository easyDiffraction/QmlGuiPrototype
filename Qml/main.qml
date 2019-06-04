import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtCharts 2.3
import easyAnalysis 1.0 as Generic
import easyAnalysis.Elements 1.0 as GenericElements
import easyAnalysis.Toolbar 1.0 as GenericToolbar
import easyAnalysis.ContentArea 1.0 as GenericContentArea
import easyAnalysis.Logic 1.0 as GenericLogic
import easyDiffraction 1.0 as Specific


import easyAnalysis.ContentArea.Pages 1.0 as GenericContentAreaPages

ApplicationWindow {
    visible: true

    minimumWidth: Generic.Style.appWindowWidth
    minimumHeight: Generic.Style.appWindowHeight
    color: Generic.Style.appBkgColor

    title: Specific.Settings.appName

    //property int toolbarCurrentIndex: -1

    ColumnLayout {
        anchors.fill: parent
        spacing: 0
        GenericToolbar.Toolbar {}
        GenericContentArea.ContentArea {}
    }

    Component.onCompleted: {
        const xhr = new XMLHttpRequest
        xhr.open("GET", "../Imports/easyAnalysis/DiffractionData/cecual.txt", false)
        xhr.send()

        Generic.Variables.xObs = GenericLogic.Parse.getColumn(xhr.responseText, 0, 1)
        Generic.Variables.yObs = GenericLogic.Parse.getColumn(xhr.responseText, 1, 1)
        Generic.Variables.syObs = GenericLogic.Parse.getColumn(xhr.responseText, 2, 1)
        Generic.Variables.yCalc = GenericLogic.Parse.getColumn(xhr.responseText, 3, 1)
        Generic.Variables.yCalcBad = GenericLogic.Parse.getColumn(xhr.responseText, 4, 1)

        //console.log(Generic.Variables.yObs)
    }

}
