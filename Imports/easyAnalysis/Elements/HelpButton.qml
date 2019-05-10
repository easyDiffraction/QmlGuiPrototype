import QtQuick.Controls 2.12

Button {
    text: "Help Button"
    ToolTip.visible: hovered
    ToolTip.text: qsTr("Get online help for this page")
}

