import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import easyAnalysis.Elements 1.0 as GenericElements
import easyAnalysis.MainArea 1.0 as GenericMainArea
import easyAnalysis.MainArea.Pages 1.0 as GenericMainAreaPages
import easyAnalysis.Sidebar.Pages 1.0 as GenericSidebarPages

GenericElements.MainAreaStack {

    tabBarContent: TabBar {
        id: tabBar
        //AsElements.TabbarButton { text: qsTr("Structure") }
        GenericMainArea.TabButton { text: qsTr("Structure"); tabbarWidth: mainArea.width }
    }

    mainAreaContent: StackLayout {
        id: mainArea
        //currentIndex: tabBar.currentIndex
        GenericMainAreaPages.SampleModel {}
    }

    sideBarContent: StackLayout {
        //currentIndex: tabBar.currentIndex
        //AsSidebar.Sample_Parameters {}
        GenericSidebarPages.SampleModel {}
    }

}
