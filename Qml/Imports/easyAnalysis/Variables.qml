pragma Singleton
import QtQuick 2.12
import QtCharts 2.3
import easyAnalysis.App.Elements 1.0 as GenericAppElements

QtObject {
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

    // Line series
    property LineSeries yObsSeriesUpper: LineSeries {useOpenGL: true}
    property LineSeries yObsSeriesLower: LineSeries {useOpenGL: true}
    property LineSeries yCalcSeries: LineSeries {useOpenGL: true}
    property LineSeries yPreCalcSeries: LineSeries {useOpenGL: true}

    // Main
    property bool showIntro: true
    property bool showGuide: true

    // Intro page
    property int introAnimationDuration: 1000

    // Paths
    property string iconsPath: ""
    property string resourcesPath: ""

}
