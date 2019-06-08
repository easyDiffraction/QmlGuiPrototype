import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import easyAnalysis.Elements 1.0 as GenericElements
import easyAnalysis.Sidebar.Pages.Linking.JobsTable 1.0 as GenericSidebarContent

GenericElements.SidebarStack {
    controlsContent: GenericSidebarContent.Controls { anchors.fill: parent }
    settingsContent: GenericSidebarContent.Settings { anchors.fill: parent }
}
