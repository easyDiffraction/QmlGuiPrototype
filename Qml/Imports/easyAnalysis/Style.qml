pragma Singleton
import QtQuick 2.12

QtObject {

    // Application
    readonly property int appWindowWidth: 1280
    readonly property int appWindowHeight: 760//800
    readonly property int appBorderThickness: 1
    readonly property color appBkgColor: "#f5f5f5"
    readonly property color appBorderColor: "gainsboro"

    readonly property int buttonHeight: 34
    readonly property int buttonRadius: 4

    // Content Area
    readonly property int contentAreaTabbarHeight: 34

    // Main Area
    readonly property int mainAreaWidth: appWindowWidth - appBorderThickness - sidebarWidth
    readonly property color mainAreaTabBorderColor: "#ccc"

    // Colors
    readonly property color blueColor: "#0099ff"//"#2293de"//"#1c8fdc"

    // Sidebar
    readonly property int sidebarWidth: 605//554//518
    readonly property int sidebarGroupInnerSpacing: 10
    readonly property int sidebarGroupIndicatorIconSize: 10
    readonly property color sidebarGroupTitleColor: blueColor
    readonly property color sidebarLabelColor: "#555"

    // Table
    readonly property int tableRowHeight: 32
    readonly property int tableColumnSpacing: 16
    readonly property int tableFontPointSize: 13
    readonly property int maxVisibleRowsCount: 5

    readonly property color tableRowColor: "white"
    readonly property color tableAlternateRowColor: "#f7f7f7"
    readonly property color tableHighlightRowColor: blueColor //Qt.lighter("dodgerblue", 1.7)
    readonly property color tableHeaderRowColor: "#eee"
    readonly property color tableColumnBorderColor: "#e8e8e8"

    readonly property color tableTextColor: "black"
    readonly property color tableDisabledTextColor: "#888"
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

    readonly property color buttonBkgDisabledColor: "#e1e1e1"
    readonly property color buttonBkgEnabledColor: "#e1e1e1"//"#666"
    readonly property color buttonBkgHighlightedColor: blueColor
    readonly property color buttonBkgFinishedColor: Qt.lighter(blueColor, 1.9) //!!!!
    readonly property color buttonBkgBlendColor: "white"
    readonly property real buttonBkgBlendAlpha: 0.25

    readonly property color buttonTextDisabledColor: "#999"
    readonly property color buttonTextEnabledColor: "#222"//"white"
    readonly property color buttonTextHighlightedColor: "white"
    readonly property color buttonTextFinishedColor: Qt.darker(blueColor, 1.5) //!!!!

    readonly property color buttonIconDisabledColor: "#bbb"
    readonly property color buttonIconEnabledColor: "#555"//"white"
    readonly property color buttonIconHighlightedColor: "white"
    readonly property color buttonIconFinishedColor: Qt.darker(blueColor, 1.2) //!!!!

    readonly property color buttonBorderDisabledColor: appBorderColor
    readonly property color buttonBorderEnabledColor: appBorderColor
    readonly property color buttonBorderHighlightedColor: buttonBkgHighlightedColor
    readonly property color buttonBorderFinishedColor: Qt.lighter(blueColor, 1.7) //!!!!

    // Icons
    readonly property string dummyIconPath: "dummy.svg"

    // Fonts
    //readonly property string introCondensedFontFamily: encodeSansSemiCondensedRegular.name
    //property FontLoader encodeSansSemiCondensedExtraLight: FontLoader { source: "Resources/Fonts/encodesanssemicondensed/EncodeSansSemiCondensed-ExtraLight.ttf" }
    //property FontLoader encodeSansSemiCondensedRegular: FontLoader { source: "Resources/Fonts/encodesanssemicondensed/EncodeSansSemiCondensed-Regular.ttf" }
    readonly property string introFontFamily: encodeSansRegular.name
    property FontLoader encodeSansExtraLight: FontLoader { source: "Resources/Fonts/encodesans/EncodeSans-ExtraLight.ttf" }
    property FontLoader encodeSansRegular: FontLoader { source: "Resources/Fonts/encodesans/EncodeSans-Regular.ttf" }
    readonly property string introExpandedFontFamily: encodeSansExpandedRegular.name
    property FontLoader encodeSansExpandedExtraLight: FontLoader { source: "Resources/Fonts/encodesansexpanded/EncodeSansExpanded-ExtraLight.ttf" }
    property FontLoader encodeSansExpandedRegular: FontLoader { source: "Resources/Fonts/encodesansexpanded/EncodeSansExpanded-Regular.ttf" }

    // Text
    readonly property int systemFontPointSize: text.font.pointSize
    property Text text: Text {}

}

