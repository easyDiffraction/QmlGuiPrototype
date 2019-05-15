pragma Singleton
import QtQuick 2.12

QtObject {

    // Application
    readonly property string appName: "easyDiffraction"
    readonly property string appVersion: "0.1.0"
    readonly property string appDate: "12 May 2019"
    readonly property string appUrl: "https://github.com/easyDiffraction/QmlGuiPrototype"

    readonly property int appWindowWidth: 1340
    readonly property int appWindowHeight: 736
    readonly property int appBorderWidth: 1
    readonly property color appBkgColor: "#f5f5f5"
    readonly property color appBorderColor: "gainsboro"

    readonly property int buttonHeight: 34
    readonly property int buttonRadius: 4

    // Table
    property int tableRowHeight: 32
    property int tableFontPointSize: 13

    property string tableRowColor: "white"
    property string tableAlternateRowColor: "#f5f5f5"
    property string tableHighlightRowColor: "dodgerblue"
    property string tableHeaderRowColor: "#e5e5e5"

    property string tableTextColor: "black"
    property string tableHighlightTextColor: "white"

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
    readonly property color buttonBkgHighlightedColor: "dodgerblue"
    readonly property color buttonBkgBlendColor: "white"
    readonly property real buttonBkgBlendAlpha: 0.25

    readonly property color buttonTextDisabledColor: "#eee"
    readonly property color buttonTextEnabledColor: "white"

    readonly property color buttonIconDisabledColor: "#ddd"
    readonly property color buttonIconEnabledColor: "white"

    // Fonts
    property FontLoader titleFontLoader: FontLoader {
        id: titleFontLoader
        source: "Fonts/encode-sans/EncodeSansSemiCondensed-ExtraLight.ttf"
    }
    readonly property alias titleFontFamily: titleFontLoader.name
    property FontLoader versionFontLoader: FontLoader {
        id: versionFontLoader
        source: "Fonts/encode-sans/EncodeSansExpanded-ExtraLight.ttf"
    }
    readonly property alias versionFontFamily: versionFontLoader.name
}
