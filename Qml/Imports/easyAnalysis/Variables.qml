pragma Singleton
import QtQuick 2.12
//import Qt.labs.settings 1.1

QtObject {

    // Load persistent settings
    //Settings { id: settings }

    // Main
    property bool showIntro: false//settings.value("showIntro", true)
    property bool showGuide: false//settings.value("showGuide", true)

    // Intro page
    property int introAnimationDuration: 1000

    // Paths
    property string iconsPath: ""
    property string resourcesPath: ""

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
