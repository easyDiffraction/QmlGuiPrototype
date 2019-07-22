import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtDataVisualization 1.3 // versions above 1.3 are not recognized by PySide2 (Qt for Python)
import easyAnalysis 1.0 as Generic

Rectangle {
    property real a: 4.25678
    property real b: a
    property real c: 10.63388

    property real xRotationInitial: -60.0
    property real yRotationInitial:  15.0
    property real zoomLevelInitial: 110.0
    property real xTargetInitial: 0.0
    property real yTargetInitial: 0.0
    property real zTargetInitial: 0.0
    property int animationDuration: 1000

    color: "coral"
    clip: true

    ///////
    // Plot
    ///////

    Scatter3D {
        id: graph
        anchors.fill: parent
        anchors.topMargin: -100
        clip: true

        // Camera view settings
        orthoProjection: false
        //scene.activeCamera.cameraPreset: Camera3D.CameraPresetIsometricLeftHigh
        scene.activeCamera.xRotation: xRotationInitial
        scene.activeCamera.yRotation: yRotationInitial
        scene.activeCamera.zoomLevel: zoomLevelInitial
        scene.activeCamera.target.x: xTargetInitial
        scene.activeCamera.target.y: yTargetInitial
        scene.activeCamera.target.z: zTargetInitial

        // Geometrical settings
        //horizontalAspectRatio: 1.0
        //aspectRatio: 1.0

        // Interactivity
        selectionMode: AbstractGraph3D.SelectionNone // Left mouse button will be used for "reset view" coded below

        // Visualization settings
        theme: Theme3D {
            type: Theme3D.ThemeUserDefined
            ambientLightStrength: 0.5
            lightStrength: 5.0
            windowColor: "white"
            backgroundEnabled: false
            labelBackgroundEnabled: false
            labelBorderEnabled: false
            labelTextColor: "grey"
            gridEnabled: false
            font.pointSize: 60
            font.family: Generic.Style.fontFamily
        }
        shadowQuality: AbstractGraph3D.ShadowQualityNone // AbstractGraph3D.ShadowQualitySoftHigh

        // X axis
        axisX: ValueAxis3D {
            //title: "a"
            //titleVisible: true
            //titleFixed: false
            //labelAutoRotation: 360
            //segmentCount: 1
            //min: 0
            //max: a
            //autoAdjustRange: false
            labelFormat: ""
        }

        // Y axis
        axisY: ValueAxis3D {
            //title: "b"
            //titleVisible: false
            //segmentCount: 1
            //min: 0
            //max: b
            //autoAdjustRange: false
            //labelAutoRotation: 0
            labelFormat: ""
        }

        // Z axis
        axisZ: ValueAxis3D {
            //title: "c"
            //titleVisible: false
            //segmentCount: 1
            //min: 0
            //max: c
            //autoAdjustRange: false
            //labelAutoRotation: 0
            labelFormat: ""
       }

        // Unit cell
        Scatter3DSeries {
            mesh: Abstract3DSeries.MeshSphere
            itemSize: 0.03
            baseColor: "grey"
            colorStyle: Theme3D.ColorStyleUniform
            ItemModelScatterDataProxy {
                itemModel: ListModel { id: cellBox }
                xPosRole: "x"
                yPosRole: "y"
                zPosRole: "z"
            }
        }

        // Ce atom
        Scatter3DSeries {
            mesh: Abstract3DSeries.MeshSphere
            //meshSmooth: true
            itemSize: 0.65
            baseColor: Generic.Style.greenColor
            colorStyle: Theme3D.ColorStyleUniform
            ItemModelScatterDataProxy {
                itemModel: ListModel { id: posCe }
                xPosRole: "x"
                yPosRole: "y"
                zPosRole: "z"
            }
        }

        // Cu1 atom
        Scatter3DSeries {
            mesh: Abstract3DSeries.MeshSphere
            itemSize: 0.45
            baseColor: Generic.Style.redColor
            ItemModelScatterDataProxy {
                itemModel: ListModel { id: posCu1 }
                xPosRole: "x"
                yPosRole: "y"
                zPosRole: "z"
            }
        }

        // Cu2 atom
        Scatter3DSeries {
            mesh: Abstract3DSeries.MeshSphere
            itemSize: 0.45
            baseColor: Generic.Style.redColor
            ItemModelScatterDataProxy {
                itemModel: ListModel { id: posCu2 }
                xPosRole: "x"
                yPosRole: "y"
                zPosRole: "z"
            }
        }

        // Al atom
        Scatter3DSeries {
            mesh: Abstract3DSeries.MeshSphere
            itemSize: 0.55
            baseColor: Generic.Style.blueColor
            ItemModelScatterDataProxy {
                itemModel: ListModel { id: posAl }
                xPosRole: "x"
                yPosRole: "y"
                zPosRole: "z"
            }
        }
    }

    ////////
    // Logic
    ////////

    Component.onCompleted: {

        // Unit cell
        const n = 1000
        for (let i = 0; i <= n; i++) {
            cellBox.append({ x: i/n*a, y: 0.0*b, z: 0.0*c })
            cellBox.append({ x: i/n*a, y: 1.0*b, z: 0.0*c })
            cellBox.append({ x: i/n*a, y: 0.0*b, z: 1.0*c })
            cellBox.append({ x: i/n*a, y: 1.0*b, z: 1.0*c })
            cellBox.append({ x: 0.0*a, y: i/n*b, z: 0.0*c })
            cellBox.append({ x: 1.0*a, y: i/n*b, z: 0.0*c })
            cellBox.append({ x: 0.0*a, y: i/n*b, z: 1.0*c })
            cellBox.append({ x: 1.0*a, y: i/n*b, z: 1.0*c })
            cellBox.append({ x: 0.0*a, y: 0.0*b, z: i/n*c })
            cellBox.append({ x: 1.0*a, y: 0.0*b, z: i/n*c })
            cellBox.append({ x: 0.0*a, y: 1.0*b, z: i/n*c })
            cellBox.append({ x: 1.0*a, y: 1.0*b, z: i/n*c })
        }

        // Ce atom
        posCe.append({ x: 0.0*a, y: 0.0*b, z: 0.0*c })
        posCe.append({ x: 1.0*a, y: 0.0*b, z: 0.0*c })
        posCe.append({ x: 0.0*a, y: 1.0*b, z: 0.0*c })
        posCe.append({ x: 1.0*a, y: 1.0*b, z: 0.0*c })
        posCe.append({ x: 0.5*a, y: 0.5*b, z: 0.5*c })
        posCe.append({ x: 0.0*a, y: 0.0*b, z: 1.0*c })
        posCe.append({ x: 1.0*a, y: 0.0*b, z: 1.0*c })
        posCe.append({ x: 0.0*a, y: 1.0*b, z: 1.0*c })
        posCe.append({ x: 1.0*a, y: 1.0*b, z: 1.0*c })

        // Cu1 atom
        posCu1.append({ x: 0.5*a, y: 0.5*b, z: 0.13224*c })
        posCu1.append({ x: 0.0*a, y: 0.0*b, z: 0.63224*c })
        posCu1.append({ x: 1.0*a, y: 0.0*b, z: 0.63224*c })
        posCu1.append({ x: 0.0*a, y: 1.0*b, z: 0.63224*c })
        posCu1.append({ x: 1.0*a, y: 1.0*b, z: 0.63224*c })

        // Cu2 atom
        posCu2.append({ x: 0.5*a, y: 0.5*b, z: 0.90437*c })
        posCu2.append({ x: 0.0*a, y: 0.0*b, z: 0.40437*c })
        posCu2.append({ x: 1.0*a, y: 0.0*b, z: 0.40437*c })
        posCu2.append({ x: 0.0*a, y: 1.0*b, z: 0.40437*c })
        posCu2.append({ x: 1.0*a, y: 1.0*b, z: 0.40437*c })

        // Al atom
        posAl.append({ x: 0.5*a, y: 0.0*b, z: 0.24981*c })
        posAl.append({ x: 0.0*a, y: 0.5*b, z: 0.24981*c })
        posAl.append({ x: 0.5*a, y: 1.0*b, z: 0.24981*c })
        posAl.append({ x: 1.0*a, y: 0.5*b, z: 0.24981*c })
        posAl.append({ x: 0.5*a, y: 0.0*b, z: 0.74981*c })
        posAl.append({ x: 0.0*a, y: 0.5*b, z: 0.74981*c })
        posAl.append({ x: 0.5*a, y: 1.0*b, z: 0.74981*c })
        posAl.append({ x: 1.0*a, y: 0.5*b, z: 0.74981*c })
    }

    // Reset view with animation: Override default left mouse button
    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton
        onClicked: animo.restart()
    }
    ParallelAnimation {
        id: animo
        NumberAnimation { easing.type: Easing.OutCubic; target: graph; property: "scene.activeCamera.target.x"; to: xTargetInitial; duration: animationDuration }
        NumberAnimation { easing.type: Easing.OutCubic; target: graph; property: "scene.activeCamera.target.y"; to: yTargetInitial; duration: animationDuration }
        NumberAnimation { easing.type: Easing.OutCubic; target: graph; property: "scene.activeCamera.target.z"; to: zTargetInitial; duration: animationDuration }
        NumberAnimation { easing.type: Easing.OutCubic; target: graph; property: "scene.activeCamera.xRotation"; to: xRotationInitial; duration: animationDuration }
        NumberAnimation { easing.type: Easing.OutCubic; target: graph; property: "scene.activeCamera.yRotation"; to: yRotationInitial; duration: animationDuration }
        NumberAnimation { easing.type: Easing.OutCubic; target: graph; property: "scene.activeCamera.zoomLevel"; to: zoomLevelInitial; duration: animationDuration }
    }

    // Info area
    Label {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: font.pointSize
        leftPadding: font.pointSize * lineHeight * 0.5
        rightPadding: font.pointSize * lineHeight * 0.5
        lineHeight: 1.5
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: qsTr("Rotate: Drag with right mouse button pressed") + "  •  " + qsTr("Zoom in/out: Mouse wheel") + "  •  " + qsTr("Reset: Left mouse button")
        font.family: Generic.Style.introThinFontFamily
        font.pointSize: Generic.Style.systemFontPointSize + 1
        color: "grey"
        background: Rectangle { color: "white"; opacity: 0.9; border.width: 0; radius: Generic.Style.toolbarButtonRadius }
    }

}
