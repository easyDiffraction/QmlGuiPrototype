import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtCharts 2.13
import easyAnalysis 1.0 as Generic

Column {
    property bool showObs: false
    property bool showCalc: false
    property bool showDiff: false

    //property var commonPlotArea: null

    property int fullHeight: parent.height - 2*padding - spacing

    property real ratio: !showDiff ? 1 : 0.7
    property int extraPadding: 10

    padding: -extraPadding
    spacing: !showDiff ? 0 : -6*extraPadding

    ///////////
    // Top plot
    ///////////

    ChartView {
        id: topChart

        anchors.left: parent.left
        anchors.right: parent.right
        height: fullHeight * ratio

        legend.visible: false
        antialiasing: true // conflicts with useOpenGL: true in ScatterSeries
        //smooth: true

        ValueAxis {
            id: axisX
            min: 15000
            max: 19000
            tickInterval: 1000
            minorTickCount: 1
            tickType: ValueAxis.TicksDynamic
            //tickInterval: 1.5
            //tickCount: 5
            labelFormat: "%.0f"
            labelsVisible: !showDiff
            titleText: !showDiff ? "TOF" : ""

        }

        ValueAxis {
            id: axisY
            min: 0 //-2e+4
            max: 1e+6 //+ 2e+4
            tickInterval: 200000
            minorTickCount: 1
            tickType: ValueAxis.TicksDynamic
            //tickInterval: 1e+2
            labelFormat: "%.0f" //"%.0e"
            titleText: "Yobs"
        }

        AreaSeries {
            id: obsArea
            visible: showObs
            axisX: axisX
            axisY: axisY
            color: Qt.lighter("dodgerblue", 1.4)
            borderColor: color
            borderWidth: 2
            upperSeries: LineSeries { id: obsSeriesUpper }
            lowerSeries: LineSeries { id: obsSeriesLower }
            //useOpenGL: true
        }

        LineSeries {
            id: calcSeries
            visible: showCalc
            axisX: axisX
            axisY: axisY
            color: "coral"
            width: 2
            //useOpenGL: true
        }
    }

    //////////////
    // Bottom plot
    //////////////

    ChartView {
        id: bottomChart

        anchors.left: parent.left
        anchors.right: parent.right
        height: fullHeight * (1 - ratio)

        anchors.leftMargin: 8

        legend.visible: false
        antialiasing: true

        //backgroundColor: "red"
        //plotArea: topChart.plotArea
        //plotArea: Qt.rect(topChart.plotArea.left, 0, topChart.plotArea.width, bottomAxesRectHeight) //topChart.plotArea

        ValueAxis {
            id: axisXdiff
            min: 15000
            max: 19000
            tickInterval: 1000
            minorTickCount: 1
            tickType: ValueAxis.TicksDynamic
            //tickInterval: 1.5
            //tickCount: 5
            labelFormat: "%.0f"
            titleText: "TOF"
        }

        ValueAxis {
            id: axisYdiff
            min: -50000
            max: 50000
            tickInterval: 50000
            tickCount: 3
            //minorTickCount: 1
            tickType: ValueAxis.TicksDynamic
            //tickInterval: 1e+2
            labelFormat: "%.0f"
            titleText: "Yobs - Ycalc"
        }

        LineSeries {
            id: diffSeries
            ///visible: showDiff
            axisX: axisXdiff
            axisY: axisYdiff
            color: "yellowgreen"
            width: 2
            //useOpenGL: true
        }
    }

    ////////
    // Logic
    ////////

    Component.onCompleted: {
        // Populate global Chart Series
        for (let i = 0; i < Generic.Variables.xObs.length; i++) {
            const xObs = parseFloat(Generic.Variables.xObs[i])
            const yObs = parseFloat(Generic.Variables.yObs[i])
            const syObs = parseFloat(Generic.Variables.syObs[i])
            const yCalc = parseFloat(Generic.Variables.yCalc[i])
            const yDiff = yObs - yCalc
            //const yPreCalc = parseFloat(Generic.Variables.yPreCalc[i])
            //console.log(xObs, yObs, syObs, yObs + syObs, yObs - syObs, yCalc, yPreCalc)
            obsSeriesUpper.append(xObs, yObs + syObs)
            obsSeriesLower.append(xObs, yObs - syObs)
            calcSeries.append(xObs, yCalc)
            diffSeries.append(xObs, yDiff)
            //preCalcSeries.append(xObs, yPreCalc)
        }
    }

}
