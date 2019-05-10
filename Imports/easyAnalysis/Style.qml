pragma Singleton
import QtQuick 2.13

QtObject {
    readonly property int appWindowWidth: 1280
    readonly property int appWindowHeight: 800
    readonly property int appBorderWidth: 1
    readonly property color appBackgroundColor: "#f5f5f5"
    readonly property color appBorderColor: "gainsboro"

    readonly property int toolbarHeight: 60
    readonly property int toolbarSpacerSize: 10
    readonly property int toolbarSpacing: 10
    readonly property color toolbarSpacerColor: "#bbb"
    readonly property color toolbarBackgroundColor: "transparent"
}
