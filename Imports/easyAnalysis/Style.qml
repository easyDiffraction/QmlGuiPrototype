pragma Singleton
import QtQuick 2.12

QtObject {

    // Application
    readonly property int appWindowWidth: 1320
    readonly property int appWindowHeight: 750
    readonly property int appBorderWidth: 1
    readonly property color appBkgColor: "#f5f5f5"
    readonly property color appBorderColor: "gainsboro"

    // Toolbar
    readonly property int toolbarButtonHeight: 40
    readonly property int toolbarButtonRadius: 4
    readonly property int toolbarSpacerSize: 10
    readonly property int toolbarSpacing: 10
    readonly property int toolbarHeight: toolbarButtonHeight + 2*toolbarSpacing
    readonly property color toolbarSpacerColor: "#bbb"
    readonly property color toolbarBkgColor: "transparent"

    readonly property color buttonBkgDisabledColor: "#aaa"
    readonly property color buttonBkgEnabledColor: "#666"
    readonly property color buttonBkgCheckedColor: "dodgerblue"
    readonly property color buttonBkgBlendColor: "white"
    readonly property real buttonBkgBlendAlpha: 0.25

    readonly property color buttonTextDisabledColor: "#eee"
    readonly property color buttonTextEnabledColor: "white"

    readonly property color buttonIconDisabledColor: "#ddd"
    readonly property color buttonIconEnabledColor: "white"
}
