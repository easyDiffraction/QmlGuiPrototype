import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import easyAnalysis 1.0 as Generic
import easyAnalysis.Elements 1.0 as GenericElements
import easyAnalysis.Sidebar 1.0 as GenericSidebar

ColumnLayout {
    property var controlsContent: null
    property var settingsContent: null

    spacing: 0

    // Sidebar including its TabBar
    TabBar {
        id: tabbar
        GenericSidebar.TabButton { text: qsTr("Controls") }
        GenericSidebar.TabButton { text: qsTr("Settings") }
    }

    // TabBar bottom border
    GenericElements.HorizontalBorder { height: tabBarContent ? Generic.Style.appBorderThickness : 0 }

    // Sidebar without TabBar
    StackLayout {
        id: stack
        Layout.fillWidth: true
        Layout.fillHeight: true
        currentIndex: tabbar.currentIndex

        // Controls Tab
        Item {
            id: controls
            children: controlsContent
        }

        // Settings Tab
        Item {
            id: settings
            children: settingsContent
        }
    }

}
