import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import easyAnalysis.Elements 1.0 as GenericElements
import easyAnalysis.MainArea 1.0 as GenericMainArea
import easyAnalysis.MainArea.Pages.ExperimentalData 1.0 as GenericMainAreaSampleModel
import easyAnalysis.Sidebar.Pages.ExperimentalData 1.0 as GenericSidebarSampleModel

GenericElements.ContentAreaStack {

    tabBarContent: TabBar {
        id: tabBar
        GenericMainArea.TabButton { text: qsTr("Plot View"); tabbarWidth: mainArea.width } // fix width
        GenericMainArea.TabButton { text: qsTr("Table View"); tabbarWidth: mainArea.width } // fix width
        GenericMainArea.TabButton { text: qsTr("Text View"); tabbarWidth: mainArea.width } // fix width
    }

    mainAreaContent: StackLayout {
        id: mainArea
        currentIndex: tabBar.currentIndex
        GenericMainAreaSampleModel.PlotView { }
        GenericMainAreaSampleModel.TableView {  }
        GenericMainAreaSampleModel.TextView {  }
    }

    sideBarContent: StackLayout {
        currentIndex: tabBar.currentIndex
        GenericSidebarSampleModel.PlotView { }
        GenericSidebarSampleModel.TableView { }
        GenericSidebarSampleModel.TextView { }
    }

}
