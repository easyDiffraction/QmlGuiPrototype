import QtQuick 2.12
import easyDiffraction 1.0 as Specific

Image {
    fillMode: Image.PreserveAspectCrop //Image.PreserveAspectFit
    clip: true
    antialiasing: true
    source: Specific.Variables.resourcesPath + "Images/Instruments/dream.png"
}


