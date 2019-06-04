pragma Singleton
import QtQuick 2.12

QtObject {

    // Application
    readonly property string appLeftName: "easy"
    readonly property string appRightName: "Diffraction"
    readonly property string appName: appLeftName + appRightName
    readonly property string appVersion: "0.1.1"
    readonly property string appDate: "4 Jun 2019"
    readonly property string appUrl: "https://github.com/easyDiffraction/QmlGuiPrototype"

    readonly property int appWindowWidth: 1280
    readonly property int appWindowHeight: 700//800
    readonly property int appBorderThickness: 1
    readonly property color appBkgColor: "#f5f5f5"
    readonly property color appBorderColor: "gainsboro"

    readonly property int buttonHeight: 34
    readonly property int buttonRadius: 4

    // Content Area
    readonly property int contentAreaTabbarHeight: 34

    // Main Area
    readonly property int mainAreaWidth: appWindowWidth - appBorderThickness - sidebarWidth

    // Sidebar
    readonly property int sidebarWidth: 554//518
    readonly property int sidebarGroupInnerSpacing: 10
    readonly property int sidebarGroupIndicatorIconSize: 10
    readonly property color sidebarGroupTitleColor: "dodgerblue"
    readonly property color sidebarLabelColor: "#555"

    // Table
    readonly property int tableRowHeight: 32
    readonly property int tableColumnSpacing: 16
    readonly property int tableFontPointSize: 13
    readonly property int maxVisibleRowsCount: 5

    readonly property color tableRowColor: "white"
    readonly property color tableAlternateRowColor: "#f7f7f7"
    readonly property color tableHighlightRowColor: "dodgerblue" //Qt.lighter("dodgerblue", 1.7)
    readonly property color tableHeaderRowColor: "#e7e7e7"
    readonly property color tableColumnBorderColor: "#e8e8e8"

    readonly property color tableTextColor: "black"
    readonly property color tableHighlightTextColor: "white"
    readonly property color tableHighlightBorderColor: Qt.lighter(tableHighlightRowColor, 1.2)

    // Toolbar
    readonly property int toolbarButtonHeight: 40
    readonly property int toolbarButtonRadius: 4
    readonly property int toolbarSpacerSize: 10
    readonly property int toolbarSpacing: 10
    readonly property int toolbarHeight: toolbarButtonHeight + 2*toolbarSpacing
    readonly property color toolbarSpacerColor: appBorderColor//"#addButton"
    readonly property color toolbarBkgColor: "transparent"

    readonly property color buttonBkgDisabledColor: "#aaa"
    readonly property color buttonBkgEnabledColor: "#e7e7e7"//"#666"
    readonly property color buttonBkgHighlightedColor: "dodgerblue"
    readonly property color buttonBkgBlendColor: "white"
    readonly property real buttonBkgBlendAlpha: 0.25

    readonly property color buttonTextDisabledColor: "#eee"
    readonly property color buttonTextEnabledColor: "#222"//"white"
    readonly property color buttonTextHighlightedColor: "white"

    readonly property color buttonIconDisabledColor: "#ddd"
    readonly property color buttonIconEnabledColor: "#555"//"white"
    readonly property color buttonIconHighlightedColor: "white"

    // Fonts
    property FontLoader titleThinFontLoader: FontLoader {
        id: titleThinFontLoader
        source: "Fonts/encode-sans/EncodeSansSemiCondensed-ExtraLight.ttf"
    }
    readonly property alias titleThinFontFamily: titleThinFontLoader.name
    property FontLoader titleThickFontLoader: FontLoader {
        id: titleThickFontLoader
        source: "Fonts/encode-sans/EncodeSansSemiCondensed-Regular.ttf"
    }
    readonly property alias titleThickFontFamily: titleThickFontLoader.name
    property FontLoader versionFontLoader: FontLoader {
        id: versionFontLoader
        source: "Fonts/encode-sans/EncodeSansExpanded-ExtraLight.ttf"
    }
    readonly property alias versionFontFamily: versionFontLoader.name
}
