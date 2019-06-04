import QtQuick 2.12
import QtCharts 2.12
import easyAnalysis 1.0 as Generic

Column {
    property int extraPadding: 12
    property int ratio: 0

    padding: -extraPadding
    spacing: -2*extraPadding

    ChartView {
        width: parent.width + 2*extraPadding
        height: parent.height + 2*extraPadding

        legend.visible: false
        //antialiasing: true // conflicts with useOpenGL: true in ScatterSeries

        ValueAxis {
            id: axisX
            min: 7000
            max: 20000
            tickInterval: 2000
            minorTickCount: 1
            tickType: ValueAxis.TicksDynamic
            //tickInterval: 1.5
            //tickCount: 5
            labelFormat: "%.0f"
            titleText: "TOF"
        }

        ValueAxis {
            id: axisY
            min: 0 //-2e+4
            max: 1e+6 //+ 2e+4
            tickInterval: 200000
            minorTickCount: 1
            tickType: ValueAxis.TicksDynamic
            //tickInterval: 1e+2
            labelFormat: "%.0e"
            titleText: "Yobs"
        }

        ScatterSeries {
            id: obs
            axisX: axisX
            axisY: axisY
            color: Qt.lighter("dodgerblue", 1.3)
            markerSize: 4
            //markerShape: ScatterSeries.MarkerShapeCircle // conflicts with useOpenGL: true in ScatterSeries
            //borderWidth: 10 // conflicts with useOpenGL: true in ScatterSeries
            //borderColor: "red" // conflicts with useOpenGL: true in ScatterSeries
            useOpenGL: true
        }

        LineSeries {
            id: obsLine
            axisX: axisX
            axisY: axisY
            //pointsVisible: true // conflicts with useOpenGL: true in ScatterSeries
            width: 2
            color: Qt.lighter("dodgerblue", 1.3)
            useOpenGL: true
        }
    }

    Component.onCompleted: {
        for (let i = 0; i < Generic.Variables.xObs.length; i++) {
            //console.log(i, Generic.Variables.xObs[i], Generic.Variables.yObs[i])
            obs.append(Generic.Variables.xObs[i], Generic.Variables.yObs[i])
            obsLine.append(Generic.Variables.xObs[i], Generic.Variables.yObs[i])
        }
    }

}
