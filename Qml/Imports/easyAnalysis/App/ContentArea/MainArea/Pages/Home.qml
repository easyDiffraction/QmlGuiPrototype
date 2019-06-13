import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import easyAnalysis.App.ContentArea.MainArea.Pages.Home 1.0 as GenericHomePage

Item {
    id: container

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 30
        spacing: 30

        Item { Layout.fillHeight: true }

        RowLayout {
            Layout.fillWidth: true
            spacing: 30

            GenericHomePage.LeftColumn {}
            GenericHomePage.MiddleColumn {}
            GenericHomePage.RightColumn { dialogParent: container }
        }

        Item { Layout.fillHeight: true }
    }
}

