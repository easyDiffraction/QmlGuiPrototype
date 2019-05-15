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

        GenericToolbarButtons.Home {
            onClicked: {
                console.log(Generic.Variables.toolbarCurrentIndex)
                Generic.Variables.toolbarCurrentIndex = 0
                console.log(Generic.Variables.toolbarCurrentIndex)
            }
        }
        GenericToolbar.Spacer {}

        GenericToolbarButtons.ExperimentalData { onClicked: Generic.Variables.toolbarCurrentIndex = 1 }
        GenericToolbarButtons.SampleModel{ onClicked: Generic.Variables.toolbarCurrentIndex = 2 }
        GenericToolbarButtons.InstrumentModel{ onClicked: Generic.Variables.toolbarCurrentIndex = 3 }
        GenericToolbar.Spacer {}

        GenericToolbarButtons.Linking{ onClicked: Generic.Variables.toolbarCurrentIndex = 4 }
        GenericToolbar.Spacer {}

        GenericToolbarButtons.Analysis{ onClicked: Generic.Variables.toolbarCurrentIndex = 5 }
        GenericToolbar.Spacer {}

        GenericToolbarButtons.Summary{ onClicked: Generic.Variables.toolbarCurrentIndex = 6 }
    }

    GenericElements.HorizontalBorder {}
}
