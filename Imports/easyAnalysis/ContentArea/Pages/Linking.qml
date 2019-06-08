import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import easyAnalysis.Elements 1.0 as GenericElements
import easyAnalysis.MainArea 1.0 as GenericMainArea
import easyAnalysis.MainArea.Pages.Linking 1.0 as GenericMainAreaLinking
import easyAnalysis.Sidebar.Pages.Linking 1.0 as GenericSidebarLinking

GenericElements.ContentAreaStack {

    tabBarContent: TabBar {
        spacing: 0
        id: tabBar
        GenericMainArea.TabButton { text: qsTr("Jobs Table"); tabbarWidth: mainArea.width } // fix width
    }

    mainAreaContent: StackLayout {
        id: mainArea
        currentIndex: tabBar.currentIndex
        GenericMainAreaLinking.JobsTable { }
    }

    sideBarContent: StackLayout {
        currentIndex: tabBar.currentIndex
        GenericSidebarLinking.JobsTable { }
    }

}
