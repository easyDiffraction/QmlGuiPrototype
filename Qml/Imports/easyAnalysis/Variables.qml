pragma Singleton
import QtQuick 2.12
import QtQuick.Window 2.12
//import Qt.labs.settings 1.1

QtObject {

    // Main
    property int showIntro: 1 // bool doesn't work on windows
    property int showGuide: 1 // bool doesn't work on windows
    property int appMinWindowWidth: 1280
    property int appMinWindowHeight: 760
    property int appWindowWidth: appMinWindowWidth
    property int appWindowHeight: appMinWindowHeight
    property int appWindowX: 0
    property int appWindowY: 0
    property int mainAreaWidth: appWindowWidth

    // Intro page
    property int introAnimationDuration: 1000

    // Paths
    property string resourcesPath: ""
    property string originalIconsPath: ""
    property string thirdPartyIconsPath: ""

    // Content area
    property int toolbarCurrentIndex: -1
    enum ToolbarIndexEnum {
        HomeIndex = 0,
        ExperimentalDataIndex = 1,
        InstrumentModelIndex = 2,
        SampleModelIndex = 3,
        LinkingIndex = 4,
        AnalysisIndex = 5,
        SummaryIndex = 6
    }

    // States
    property bool homePageFinished: false
    property bool dataPageFinished: false
    property bool samplePageFinished: false
    property bool instrumentPageFinished: false
    property bool linkingPageFinished: false
    property bool analysisPageFinished: false
    property bool summaryPageFinished: false

    // Data arrays
    property var xPeaks: []
    property var xObs: []
    property var yObs: []
    property var syObs: []
    property var yCalc: []
    property var yPreCalc: []

}
