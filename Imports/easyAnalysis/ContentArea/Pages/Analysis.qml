import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import easyAnalysis.Elements 1.0 as GenericElements
import easyAnalysis.MainArea 1.0 as GenericMainArea
import easyAnalysis.MainArea.Pages.Analysis 1.0 as GenericMainAreaAnalysis
import easyAnalysis.Sidebar.Pages.Analysis 1.0 as GenericSidebarAnalysis

GenericElements.ContentAreaStack {

    tabBarContent: TabBar {
        spacing: 0
        id: tabBar
        //GenericMainArea.TabButton { text: qsTr("Simulation"); tabbarWidth: mainArea.width } // fix width
        GenericMainArea.TabButton { text: qsTr("Fitting"); tabbarWidth: mainArea.width } // fix width
        GenericMainArea.TabButton { text: qsTr("Constraints"); tabbarWidth: mainArea.width } // fix width
    }

    mainAreaContent: StackLayout {
        id: mainArea
        currentIndex: tabBar.currentIndex
        ///width: 500
        ///height: 400
        //GenericMainAreaAnalysis.Simulation { }
        GenericMainAreaAnalysis.Fitting { }
        GenericMainAreaAnalysis.Constraints { }
    }

    sideBarContent: StackLayout {
        currentIndex: tabBar.currentIndex
        //GenericSidebarAnalysis.Simulation { }
        GenericSidebarAnalysis.Fitting { }
        GenericSidebarAnalysis.Constraints { }
    }

}
