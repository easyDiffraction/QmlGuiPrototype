import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import easyAnalysis 1.0 as Generic
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

        GenericToolbarButtons.Home {}
        GenericToolbar.Spacer {}

        GenericToolbarButtons.ExperimentalData {}
        GenericToolbarButtons.SampleModel{}
        GenericToolbarButtons.InstrumentModel{}
        GenericToolbar.Spacer {}

        GenericToolbarButtons.Linking{}
        GenericToolbar.Spacer {}

        GenericToolbarButtons.Analysis{}
        GenericToolbar.Spacer {}

        GenericToolbarButtons.Summary{}
    }

    HorisontalBorder {}
}
