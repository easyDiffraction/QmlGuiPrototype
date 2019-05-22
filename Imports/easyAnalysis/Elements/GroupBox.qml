import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import easyAnalysis 1.0 as Generic
import easyAnalysis.Elements 1.0 as GenericElements

Column {
    property string title: "Collapsible Group"
    property bool collapsed: false
    property bool showBorder: true
    property alias content: layout.children

    //Layout.fillWidth: true
    width: parent.width
    spacing: 0

    /////////////
    // Title area
    /////////////
    Button {
        id: titleArea
        leftPadding: 5
        text: title
        icon.source: collapsed ? "../Icons/RightTriangleArrow.svg" : "../Icons/DownTriangleArrow.svg"

        background: Rectangle {
            implicitHeight: 40
            visible: !titleArea.flat || titleArea.down || titleArea.checked || titleArea.highlighted
            color: "transparent"
        }

        // Click area for collapsion
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (collapsed) {
                    collapsed = false
                    contentArea.height = groupBox.height
                }
                else {
                    collapsed = true
                    contentArea.height = 0
                }
            }
        }
    }

    ///////////////
    // Content area
    ///////////////
    Item {
        id: contentArea
        width: parent.width
        height: collapsed ? 0 : groupBox.height // default: open
        clip: true

        // Groupbox for "content"
        GroupBox {
            id: groupBox
            width: parent.width
            topPadding: 0
            leftPadding: 18

            background: Rectangle {
                y: groupBox.topPadding - groupBox.bottomPadding
                width: groupBox.width
                height: groupBox.height - groupBox.topPadding + groupBox.bottomPadding

                color: "transparent"
                //border.color: control.palette.mid
            }

            GridLayout {
                id: layout
                width: parent.width
            }
        }

        // Collapsion animation
        Behavior on height { NumberAnimation { duration: 150 } }
    }

    ////////////////
    // Bottom border
    ////////////////
    Rectangle {
        width: parent.width
        height: showBorder ? Generic.Style.appBorderThickness : 0
        color: Generic.Style.appBorderColor
    }

}
