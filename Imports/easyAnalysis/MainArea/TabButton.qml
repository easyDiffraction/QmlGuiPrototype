import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import easyAnalysis 1.0 as Generic
import easyAnalysis.Elements 1.0 as GenericElements
import easyAnalysis.ContentArea 1.0 as GenericContentArea

GenericContentArea.TabButton {
    property int tabbarWidth: Generic.Style.mainAreaWidth
    width: tabbarWidth / 4 - 1

    // Vertical borde on the left
    Rectangle {
        width: parent.checked ? 0 : 1
        height: parent.height
        color: Generic.Style.appBorderColor
    }
}

