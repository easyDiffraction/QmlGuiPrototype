import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Templates 2.12 as T
import QtQuick.Layouts 1.12
import easyAnalysis 1.0 as Generic

RowLayout {
    property alias currentIndex: control.currentIndex
    property alias model: control.model

    property bool sizeToContents: true
    property int modelWidth: 0

    id: cellLayout
    anchors.fill: parent
    spacing: 0

    // Vertical border
    Rectangle {
        Layout.fillHeight: true
        width: Generic.Style.appBorderThickness
        ///color: styleData.selected ? Generic.Style.tableHighlightBorderColor : Generic.Style.tableHeaderRowColor
        color: Generic.Style.tableColumnBorderColor
    }

    // Vertical spacer
    Item { width: Generic.Style.tableColumnSpacing/2 }


    // Content
    ComboBox {
        id: control
        leftPadding: 0
        rightPadding: 0
        Layout.fillHeight: true

        indicator: Canvas {
            id: canvas
            x: control.width - width
            y: control.topPadding + (control.availableHeight - height) / 2
            width: 10
            height: 15
            contextType: "2d"

            onPaint: {
                context.reset();

                context.moveTo(0, height / 3)
                context.lineTo(width / 2, 0)
                context.lineTo(width, height / 3)
                context.closePath()

                context.moveTo(0, height * 2 / 3)
                context.lineTo(width / 2, height)
                context.lineTo(width, height * 2 / 3);
                context.closePath();

                context.fillStyle = Generic.Style.buttonIconEnabledColor
                context.fill()
            }
        }

        background: Rectangle {
            implicitWidth: modelWidth + 2*canvas.width
            //implicitHeight: 40
            color: "transparent"
            border.color: control.palette.highlight
            border.width: !control.editable && control.visualFocus ? 2 : 0
            visible: !control.flat || control.down
        }

        TextMetrics {
            id: textMetrics
        }

        Component.onCompleted: {
            textMetrics.font = control.font
            for(var i = 0; i < model.length; i++){
                textMetrics.text = model[i]
                modelWidth = Math.max(textMetrics.width, modelWidth)
            }

            contentItem.leftPadding = 0
            popup.width = modelWidth + 30 // ?
        }
    }

    // Vertical spacer
    Item { width: Generic.Style.tableColumnSpacing/2 }


}

/*
RowLayout {
    id: headerLayout
    anchors.fill: parent
    spacing: 0

    property alias model: control.model
    property alias currentIndex: control.currentIndex
    //property alias w: control.implicitWidth

    ComboBox {
        id: control

        //implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
        //                        implicitContentWidth + leftPadding + rightPadding)
        implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                                 implicitContentHeight + topPadding + bottomPadding,
                                 implicitIndicatorHeight + topPadding + bottomPadding)

        implicitWidth: 85

        Component.onCompleted: {
            console.log(implicitBackgroundWidth, leftInset, rightInset, implicitContentWidth, leftPadding, rightPadding)
            console.log("model", model)
        }

        //leftPadding: -6
        //rightPadding: -8

        //anchors.margins: 20

        background: Rectangle {
            color: "transparent"
        }

        indicator: ColorImage {
            //x: control.width - width - control.rightPadding
            x: control.mirrored ? control.padding : control.width - width - control.padding
            y: control.topPadding + (control.availableHeight - height) / 2
            color: control.palette.dark
            defaultColor: "#353637"
            source: "qrc:/qt-project.org/imports/QtQuick/Controls.2/images/double-arrow.png"
            opacity: enabled ? 1 : 0.3
        }
    }

    // Vertical border
    Rectangle {
        Layout.fillHeight: true
        width: Generic.Style.appBorderThickness
        ///color: styleData.selected ? Generic.Style.tableHighlightBorderColor : Generic.Style.tableHeaderRowColor
        color: Generic.Style.tableColumnBorderColor
    }

}

*/

/*

T.ComboBox {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding,
                             implicitIndicatorHeight + topPadding + bottomPadding)

    leftPadding: padding + (!control.mirrored || !indicator || !indicator.visible ? 0 : indicator.width + spacing)
    rightPadding: padding + (control.mirrored || !indicator || !indicator.visible ? 0 : indicator.width + spacing)

    delegate: ItemDelegate {
        width: parent.width
        text: control.textRole ? (Array.isArray(control.model) ? modelData[control.textRole] : model[control.textRole]) : modelData
        palette.text: control.palette.text
        palette.highlightedText: control.palette.highlightedText
        font.weight: control.currentIndex === index ? Font.DemiBold : Font.Normal
        highlighted: control.highlightedIndex === index
        hoverEnabled: control.hoverEnabled
    }

    indicator: ColorImage {
        x: control.mirrored ? control.padding : control.width - width - control.padding
        y: control.topPadding + (control.availableHeight - height) / 2
        color: control.palette.dark
        defaultColor: "#353637"
        source: "qrc:/qt-project.org/imports/QtQuick/Controls.2/images/double-arrow.png"
        opacity: enabled ? 1 : 0.3
    }

    contentItem: T.TextField {
        leftPadding: !control.mirrored ? 12 : control.editable && activeFocus ? 3 : 1
        rightPadding: control.mirrored ? 12 : control.editable && activeFocus ? 3 : 1
        topPadding: 6 - control.padding
        bottomPadding: 6 - control.padding

        text: control.editable ? control.editText : control.displayText

        enabled: control.editable
        autoScroll: control.editable
        readOnly: control.down
        inputMethodHints: control.inputMethodHints
        validator: control.validator

        font: control.font
        color: control.editable ? control.palette.text : control.palette.buttonText
        selectionColor: control.palette.highlight
        selectedTextColor: control.palette.highlightedText
        verticalAlignment: Text.AlignVCenter

        background: Rectangle {
            visible: control.enabled && control.editable && !control.flat
            border.width: parent && parent.activeFocus ? 2 : 1
            border.color: parent && parent.activeFocus ? control.palette.highlight : control.palette.button
            color: control.palette.base
        }
    }

    background: Rectangle {
        implicitWidth: 140
        implicitHeight: 40

        color: control.down ? control.palette.mid : control.palette.button
        border.color: control.palette.highlight
        border.width: !control.editable && control.visualFocus ? 2 : 0
        visible: !control.flat || control.down
    }

    popup: T.Popup {
        y: control.height
        width: control.width
        height: Math.min(contentItem.implicitHeight, control.Window.height - topMargin - bottomMargin)
        topMargin: 6
        bottomMargin: 6

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: control.delegateModel
            currentIndex: control.highlightedIndex
            highlightMoveDuration: 0

            Rectangle {
                z: 10
                width: parent.width
                height: parent.height
                color: "transparent"
                border.color: control.palette.mid
            }

            T.ScrollIndicator.vertical: ScrollIndicator { }
        }

        background: Rectangle {
            color: control.palette.window
        }
    }
}
*/
