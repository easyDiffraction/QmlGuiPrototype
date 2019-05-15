import QtQuick 2.12
import QtQuick.Controls 2.12
import easyAnalysis 1.0 as Generic

// TabButton is used to be able to see this component inside the TabBar area
TabButton {
    enabled: false
    width: 2*Generic.Style.toolbarSpacerSize

    background: Rectangle { color: "transparent" }

    // Draw circle using rectangle
    Rectangle {
        anchors.centerIn: parent
        width: Generic.Style.toolbarSpacerSize
        height: Generic.Style.toolbarSpacerSize
        radius: Generic.Style.toolbarSpacerSize
        color: Generic.Style.toolbarSpacerColor
    }
}

