import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import easyAnalysis 1.0 as Generic

Button {
    id: button

    icon.width: Generic.Style.buttonHeight / 2
    icon.height: Generic.Style.buttonHeight / 2
    icon.color: iconColor() //button.enabled ? Generic.Style.buttonIconEnabledColor : Generic.Style.buttonIconDisabledColor

    ToolTip.visible: ToolTip.text !== "" ? hovered : false

    contentItem: IconLabel {
        spacing: button.spacing
        mirrored: button.mirrored
        display: button.display
        icon: button.icon
        text: button.text
        font: button.font
        color: textColor() //button.enabled ? Generic.Style.buttonTextEnabledColor : Generic.Style.buttonTextDisabledColor
    }

    background: Rectangle {
        implicitHeight: Generic.Style.buttonHeight
        color: backgroundColor()
        border.color: Generic.Style.appBorderColor
        radius: Generic.Style.toolbarButtonRadius
    }

    function backgroundColor() {
        if (!button.enabled)
            return Generic.Style.buttonBkgDisabledColor
        var color1 = button.highlighted ? Generic.Style.buttonBkgHighlightedColor : Generic.Style.buttonBkgEnabledColor
        var color2 = Generic.Style.buttonBkgBlendColor
        var alpha = button.down ? Generic.Style.buttonBkgBlendAlpha : 0.0
        return Color.blend(color1, color2, alpha)
    }

    function iconColor() {
        if (!button.enabled)
            return Generic.Style.buttonIconDisabledColor
        return button.highlighted ? Generic.Style.buttonIconHighlightedColor : Generic.Style.buttonIconEnabledColor
    }

    function textColor() {
        if (!button.enabled)
            return Generic.Style.buttonTextDisabledColor
        return button.highlighted ? Generic.Style.buttonTextHighlightedColor : Generic.Style.buttonTextEnabledColor
    }
}
