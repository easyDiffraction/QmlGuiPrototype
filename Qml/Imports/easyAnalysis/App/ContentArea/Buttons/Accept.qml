import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import easyAnalysis 1.0 as Generic
import easyAnalysis.App.ContentArea 1.0 as GenericAppContentArea

GenericAppContentArea.Button {
    Layout.fillWidth: true
    icon.source: Generic.Variables.iconsPath + "Accept.svg" // https://www.iconfinder.com/icons/103183/accept_check_checkround_ok_yes_icon
}
