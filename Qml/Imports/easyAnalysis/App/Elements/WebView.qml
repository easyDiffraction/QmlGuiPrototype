import QtQuick 2.12
import QtQuick.Controls 2.12
//import QtWebView 1.12 // WebView
import QtWebEngine 1.8 // WebEngineView
import easyAnalysis 1.0 as Generic

Page {
    property bool showInfo: true
    property alias webView: webView

    ////////////////////
    // Loading info area
    ////////////////////

    Label {
        id: label
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: "grey"
        background: Rectangle { color: "transparent" }
        font.family: Generic.Style.introThinFontFamily
        font.pointSize: Generic.Style.systemFontPointSize + 1
        lineHeight: 1.5
    }

    ////////////////
    // Web view area
    ////////////////

    //WebView {
    WebEngineView {
        // https://doc.qt.io/qt-5.12/qtwebengine-webengine-recipebrowser-example.html
        // https://github.com/plexinc/plex-media-player/blob/master/src/ui/webview.qml
        id: webView
        anchors.fill: parent
        zoomFactor: 1.13 // To adjust program TabBarButton width and web ToolBar width
        clip: true
        //backgroundColor: "transparent"
        url: "https://www.google.com"

        settings.errorPageEnabled: false
        settings.focusOnNavigationEnabled: false
        //settings.accelerated2dCanvasEnabled: false
        //settings.showScrollBars: false

        onLoadingChanged:{
            if (loadRequest.status == WebEngineView.LoadStartedStatus) {
                label.text = "The following page is currently loading:\n" + loadRequest.url
            } else if (loadRequest.status == WebEngineView.LoadSucceededStatus) {
                label.text = "The following page successfully loaded:\n" + loadRequest.url
                //webView.runJavaScript("document.getElementsByTagName('body')[0].style = 'overflow: auto;'", function(result) { console.log(result); });
            } else if (loadRequest.status == WebEngineView.LoadFailedStatus) {
                label.text = "The following page has failed to load:\n" + loadRequest.url + "\nError code: " + loadRequest.errorCode
            } else {
                label.text = "Undefined status"
            }
        }
    }

    //////////////////////////
    // Mouse actions info area
    //////////////////////////

    Label {
        visible: showInfo
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: font.pointSize
        leftPadding: font.pointSize * lineHeight * 0.5
        rightPadding: font.pointSize * lineHeight * 0.5
        lineHeight: 1.5
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: qsTr("Open link: Left mouse button") + "  •  " + qsTr("Scroll: Mouse wheel") + "  •  " + qsTr("Context menu: Right mouse button")
        font.family: Generic.Style.introThinFontFamily
        font.pointSize: Generic.Style.systemFontPointSize + 1
        color: "grey"
        background: Rectangle { color: "white"; opacity: 0.9; border.width: 0; radius: Generic.Style.toolbarButtonRadius }
    }

    /*
    Rectangle {
        id: infoAreaContainer
        visible: showInfo
        Layout.fillWidth: true
        height: Generic.Style.buttonHeight + Generic.Style.sidebarGroupInnerSpacing + 2*Generic.Style.appBorderThickness
        color: "transparent"

        Label {
            id: infoArea
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            height: Generic.Style.buttonHeight
            leftPadding: font.pointSize
            rightPadding: font.pointSize
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: qsTr("Show coordinates: Hover mouse pointer") + "  •  " + qsTr("Zoom in: Left mouse button") + "  •  " + qsTr("Reset: Right mouse button")
            font.family: Generic.Style.introThinFontFamily
            font.pointSize: Generic.Style.systemFontPointSize + 1
            color: "grey"
            background: Rectangle { color: "white"; opacity: 0.9; border.width: 0; radius: Generic.Style.toolbarButtonRadius }
        }
    }
    */
}
