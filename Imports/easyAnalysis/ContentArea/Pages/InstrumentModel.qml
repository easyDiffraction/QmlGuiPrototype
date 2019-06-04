import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import easyAnalysis.Elements 1.0 as GenericElements
import easyAnalysis.MainArea 1.0 as GenericMainArea
import easyAnalysis.MainArea.Pages.InstrumentModel 1.0 as GenericMainAreaInstrumentModel
import easyAnalysis.Sidebar.Pages.InstrumentModel 1.0 as GenericSidebarInstrumentModel

GenericElements.ContentAreaStack {

    tabBarContent: TabBar {
        spacing: 0
        id: tabBar
        GenericMainArea.TabButton { text: qsTr("Web View"); tabbarWidth: mainArea.width } // fix width
    }

    mainAreaContent: StackLayout {
        id: mainArea
        currentIndex: tabBar.currentIndex
        GenericMainAreaInstrumentModel.WebView { }
    }

    sideBarContent: StackLayout {
        currentIndex: tabBar.currentIndex
        GenericSidebarInstrumentModel.WebView { }
    }

}
