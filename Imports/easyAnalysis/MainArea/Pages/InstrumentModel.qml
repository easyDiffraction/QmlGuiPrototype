import QtQuick 2.12
import QtQuick.Controls 2.12
//import QtQuick.Layouts 1.12

Rectangle {
    color: "#eee"

    Image {
        //height: parent.height
        width: parent.width
        fillMode: Image.PreserveAspectFit
        clip: true
        source: "../../DiffractionData/cecual.png"
    }
}
