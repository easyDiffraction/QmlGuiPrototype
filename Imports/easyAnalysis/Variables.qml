pragma Singleton
import QtQuick 2.12

QtObject {
    // Content area
    property int toolbarCurrentIndex: 0
    enum ToolbarIndexEnum {
        HomeIndex = 0,
        ExperimentalDataIndex = 2,
        SampleModelIndex = 3,
        InstrumentModelIndex = 4,
        LinkingIndex = 6,
        AnalysisIndex = 8,
        SummaryIndex = 10
    }

    // Data arrays
    property var xPeaks: []
    property var xObs: []
    property var yObs: []
    property var syObs: []
    property var yCalc: []
    property var yCalcBad: []

    // Main
    property bool showGuide: true

}
