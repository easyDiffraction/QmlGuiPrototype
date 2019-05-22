import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import easyAnalysis 1.0 as Generic
import easyAnalysis.ContentArea 1.0 as GenericContentArea

GenericContentArea.TabButton {
    property int tabbarWidth: Generic.Style.mainAreaWidth
    width: tabbarWidth / 4 - 1
}

