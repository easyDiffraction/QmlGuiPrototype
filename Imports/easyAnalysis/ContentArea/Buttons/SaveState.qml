import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import easyAnalysis.ContentArea 1.0 as GenericContentArea

GenericContentArea.Button {
    icon.source: "../../Icons/Disk.svg" // https://www.iconfinder.com/icons/111010/disk_icon
    ToolTip.text: qsTr("Save current state of the project")
}


