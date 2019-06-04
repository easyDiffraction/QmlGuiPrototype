import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.12
import easyAnalysis 1.0 as Generic
import easyAnalysis.Elements 1.0 as GenericElements
import easyAnalysis.ContentArea.Buttons 1.0 as GenericContentAreaButtons

Dialog {
    property alias message: messageItem.text

    property int toY: 0
    property int arrowWidth: 10
    property int arrowHeight: 20
    property int canvasMargins: 20

    property int animationDuration: 300

    id: dialog

    //visible: true
    modal: true
    padding: 0

    // Redefine background below
    background: Rectangle {
        color: "transparent"
    }

    // Not faded area
    Overlay.modal: Rectangle {
        id: fadeOut
        property real transparency: 0
        color: Color.transparent("black", transparency)
        // Animation
        NumberAnimation on transparency { from: 0; to: 0.5; duration: animationDuration }
    }

    // Animation
    NumberAnimation on opacity { from: 0; to: 1; duration: animationDuration }

    // Custom background
    Canvas {
        id: canvas

        width: layout.width + arrowWidth
        height: layout.height

        x: -(width + canvasMargins/2)
        y: toY - height/2

        onPaint:{
            let ctx = canvas.getContext('2d');
            ctx.fillStyle = Qt.rgba(0.9, 0.9, 0.9, 1)

            ctx.beginPath()

            ctx.moveTo(0, 0)
            ctx.lineTo(0, height)
            ctx.lineTo(width - arrowWidth, height)
            ctx.lineTo(width - arrowWidth, height/2 + arrowHeight/2)
            ctx.lineTo(width, height/2 )
            ctx.lineTo(width - arrowWidth, height/2 - arrowHeight/2)
            ctx.lineTo(width - arrowWidth, 0);

            ctx.fill();
        }

        ColumnLayout {
            id: layout
            spacing: 0

            // Upper circles
            RowLayout {
                Layout.margins: canvasMargins/2
                spacing: 5
                Item { Layout.fillWidth: true }
                Text { color: "#888"; font.pointSize: 8; text: "\u25CF" }
                Text { color: "#bfbfbf"; font.pointSize: 8; text: "\u25CF" }
                Text { color: "#bfbfbf"; font.pointSize: 8; text: "\u25CF" }
                Text { color: "#bfbfbf"; font.pointSize: 8; text: "\u25CF" }
                Item { Layout.fillWidth: true }
            }

            // Main text
            Text {
                id: messageItem
                Layout.margins: canvasMargins
            }

            // Additional spacing
            Item { height: canvasMargins }

            // Horisontal line
            GenericElements.HorizontalBorder { color: "#ccc" }

            // Bottom buttons
            RowLayout {
                Layout.margins: canvasMargins/2
                spacing: 20
                Item { Layout.fillWidth: true }
                Text { color: "#999"; font.pointSize: 14; text: qsTr("Prev") }
                Text { color: "#666"; font.pointSize: 14; text: qsTr("Next") }
                Item { Layout.fillWidth: true }
            }
        }
    }
}

/*

Canvas {
    property alias content: contentLayout.children

    property int arrowWidth: 10
    property int arrowHeight: 20
    property int canvasMargins: 20

    id: canvas

    width: layout.width + arrowWidth
    height: layout.height

    x: -(width + canvasMargins)
    //y: -(height + canvasMargins)/2
    //y: (addButton.y + addButton.height + replaceButton.y - height) / 2
    //y: (addButton.y + addButton.height + replaceButton.y - height) / 2

    onPaint:{
        let ctx = canvas.getContext('2d');
        ctx.fillStyle = Qt.rgba(1, 1, 1, 1)

        ctx.beginPath()

        ctx.moveTo(0, 0)
        ctx.lineTo(0, height)
        ctx.lineTo(width - arrowWidth, height)
        ctx.lineTo(width - arrowWidth, height/2 + arrowHeight/2)
        ctx.lineTo(width, height/2 )
        ctx.lineTo(width - arrowWidth, height/2 - arrowHeight/2)
        ctx.lineTo(width - arrowWidth, 0);

        ctx.fill();
    }

    ColumnLayout {
        id: layout
        spacing: 0

        // Upper circles
        RowLayout {
            Layout.margins: canvasMargins/2
            spacing: 5
            Item { Layout.fillWidth: true }
            Text { color: "#999"; font.pointSize: 8; text: "\u25CF" }
            Text { color: "#ddd"; font.pointSize: 8; text: "\u25CF" }
            Text { color: "#ddd"; font.pointSize: 8; text: "\u25CF" }
            Text { color: "#ddd"; font.pointSize: 8; text: "\u25CF" }
            Item { Layout.fillWidth: true }
        }

        // Main content
        ColumnLayout { id: contentLayout; Layout.margins: canvasMargins }

        // Additional spacing
        Item { height: canvasMargins }

        // Horisontal line
        GenericElements.HorizontalBorder {}

        // Bottom buttons
        RowLayout {
            Layout.margins: canvasMargins/2
            spacing: 20
            Item { Layout.fillWidth: true }
            Text { color: "#999"; font.pointSize: 14; text: qsTr("Prev") }
            Text { color: "#666"; font.pointSize: 14; text: qsTr("Next") }
            Item { Layout.fillWidth: true }
        }

    }




}

*/
