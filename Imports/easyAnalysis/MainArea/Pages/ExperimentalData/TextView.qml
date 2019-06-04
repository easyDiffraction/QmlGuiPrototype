import QtQuick 2.12
import QtQuick.Controls 2.12

//https://forum.qt.io/topic/90101/textarea-does-not-automatically-scroll/5

Rectangle {
    color: "white"

    ScrollView {
        anchors.fill: parent
        clip: true

        TextArea {
            id: textArea
            anchors.fill: parent
            padding: 10
            readOnly: true
            font.family: "Monaco"
            //antialiasing: true
            //wrapMode: Text.WordWrap
            text: fileContent()
        }
    }

    function fileContent () {
        const xhr = new XMLHttpRequest
        xhr.open("GET", "../../../DiffractionData/cecual.dat", false)
        xhr.send()
        return xhr.responseText
    }

}
