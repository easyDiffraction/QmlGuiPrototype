pragma Singleton
import QtQuick 2.12

QtObject {

    readonly property string appLeftName: "easy"
    readonly property string appRightName: "Diffraction"
    readonly property string appName: appLeftName + appRightName
    readonly property string appVersion: "0.1.5"
    readonly property string appDate: "13 Jun 2019"
    readonly property string appUrl: "https://github.com/easyDiffraction/QmlGuiPrototype"

}
