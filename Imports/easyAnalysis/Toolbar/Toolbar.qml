import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import easyAnalysis 1.0 as Generic
import easyAnalysis.Elements 1.0 as GenericElements
import easyAnalysis.Toolbar 1.0 as GenericToolbar
import easyAnalysis.Toolbar.Buttons 1.0 as GenericToolbarButtons

ColumnLayout{
    id: main
    spacing: 0
    Layout.fillWidth: true
    Layout.preferredHeight: Generic.Style.toolbarHeight

    TabBar {
        id: tabBar
        spacing: Generic.Style.toolbarSpacing
        Layout.fillWidth: true
        Layout.leftMargin: Generic.Style.toolbarSpacing
        Layout.rightMargin: Generic.Style.toolbarSpacing
        background: Rectangle { color: "transparent" }

        currentIndex: Generic.Variables.toolbarCurrentIndex

        GenericToolbarButtons.Home {
            onClicked: Generic.Variables.toolbarCurrentIndex = Generic.Variables.HomeIndex
        }

        // -------
        ///GenericToolbar.Spacer { }
        // -------

        GenericToolbarButtons.ExperimentalData {
            enabled: Generic.Variables.homePageFinished
            onClicked: Generic.Variables.toolbarCurrentIndex = Generic.Variables.ExperimentalDataIndex
        }
        GenericToolbarButtons.InstrumentModel {
            enabled: Generic.Variables.dataPageFinished
            onClicked: Generic.Variables.toolbarCurrentIndex = Generic.Variables.InstrumentModelIndex
        }
        GenericToolbarButtons.SampleModel {
            enabled: Generic.Variables.instrumentPageFinished
            onClicked: Generic.Variables.toolbarCurrentIndex  = Generic.Variables.SampleModelIndex
        }

        // -------
        ///GenericToolbar.Spacer {}
        // -------

        GenericToolbarButtons.Linking {
            enabled: Generic.Variables.samplePageFinished
            onClicked: Generic.Variables.toolbarCurrentIndex = Generic.Variables.LinkingIndex
        }

        // -------
        ///GenericToolbar.Spacer {}
        // -------

        GenericToolbarButtons.Analysis {
            enabled: Generic.Variables.linkingPageFinished
            onClicked: Generic.Variables.toolbarCurrentIndex = Generic.Variables.AnalysisIndex
        }

        // -------
        ///GenericToolbar.Spacer {}
        // -------

        GenericToolbarButtons.Summary {
            enabled: Generic.Variables.analysisPageFinished
            onClicked: Generic.Variables.toolbarCurrentIndex = Generic.Variables.SummaryIndex
        }
    }

    GenericElements.HorizontalBorder {}
}
