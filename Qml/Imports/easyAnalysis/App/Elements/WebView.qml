import QtQuick 2.12
import QtQuick.Controls 2.12
//import QtWebView 1.12 // WebView
import QtWebEngine 1.9 // WebEngineView
import easyAnalysis 1.0 as Generic

Page {
    property alias webView: webView

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

    WebEngineView {
        // https://doc.qt.io/qt-5.12/qtwebengine-webengine-recipebrowser-example.html
        // https://github.com/plexinc/plex-media-player/blob/master/src/ui/webview.qml
        id: webView
        anchors.fill: parent
        zoomFactor: 1.13 // To adjust program TabBarButton width and web ToolBar width
        clip: true
        url: "https://www.google.com"

        settings.errorPageEnabled: false
        settings.focusOnNavigationEnabled: false
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
}
