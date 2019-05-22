import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import easyAnalysis 1.0 as Generic
import easyAnalysis.ContentArea.Pages 1.0 as GenericContentAreaPages

StackLayout {
    //width: parent.width
    //Layout.fillWidth: true
    //Layout.fillHeight: true

    currentIndex: Generic.Variables.toolbarCurrentIndex

    //GenericContentAreaPages.Home {}
    //GenericContentAreaPages.ExperimentalData {}
    GenericContentAreaPages.SampleModel {}
    //GenericContentAreaPages.InstrumentModel {}
    //GenericContentAreaPages.Linking {}
    //GenericContentAreaPages.Analysis {}
    //GenericContentAreaPages.Summary {}
}
