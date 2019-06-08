import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import easyAnalysis 1.0 as Generic
import easyAnalysis.ContentArea 1.0 as GenericContentArea
import easyAnalysis.ContentArea.Pages 1.0 as GenericContentAreaPages

StackLayout {
    //width: parent.width
    //Layout.fillWidth: true
    //Layout.fillHeight: true

    currentIndex: Generic.Variables.toolbarCurrentIndex

    GenericContentAreaPages.Home {}

    // -------
    //GenericContentArea.Spacer {}
    // -------

    GenericContentAreaPages.ExperimentalData {}
    GenericContentAreaPages.InstrumentModel {}
    GenericContentAreaPages.SampleModel {}

    // -------
    //GenericContentArea.Spacer {}
    // -------

    GenericContentAreaPages.Linking {}

    // -------
    //GenericContentArea.Spacer {}
    // -------

    GenericContentAreaPages.Analysis {}

    // -------
    //GenericContentArea.Spacer {}
    // -------

    GenericContentAreaPages.Summary {}
}
