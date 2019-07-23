import QtQuick 2.12
//import easyAnalysis 1.0 as Generic
import easyAnalysis.App.Elements 1.0 as GenericAppElements

GenericAppElements.WebView {
    webView.url: "https://europeanspallationsource.se/instruments/dream"
}



/*
import QtQuick 2.12
import easyDiffraction 1.0 as Specific

Image {
    fillMode: Image.PreserveAspectCrop //Image.PreserveAspectFit
    clip: true
    antialiasing: true
    source: Specific.Variables.resourcesPath + "Images/Instruments/dream.png"
}
*/
