import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtDataVisualization 1.12
import easyAnalysis 1.0 as Generic

Rectangle {
    property real a: 4.25678
    property real b: a
    property real c: 10.63388

    color: "transparent"

    //anchors.topMargin: -extraPadding

    ///////
    // Plot
    ///////

    Scatter3D {
        anchors.fill: parent
        anchors.margins: 2

        orthoProjection: false
        //scene.activeCamera.cameraPreset: Camera3D.CameraPresetIsometricLeftHigh
        scene.activeCamera.xRotation: -60.0
        scene.activeCamera.yRotation: 20.0
        scene.activeCamera.zoomLevel: 110.0

        //horizontalAspectRatio: 1.0
        //aspectRatio: 1.0

        selectionMode: AbstractGraph3D.SelectionNone

        theme: Theme3D {
            type: Theme3D.ThemePrimaryColors
            ambientLightStrength: 0.6
            //lightStrength: 0
            gridEnabled: false
            font.pointSize: 60
        }
        shadowQuality: AbstractGraph3D.ShadowQualityNone
        //shadowQuality: AbstractGraph3D.ShadowQualitySoftHigh

        // X axis
        axisX: ValueAxis3D {
            title: "a"
            titleVisible: true
            //segmentCount: 1
            min: 0
            max: a
            autoAdjustRange: false
            //labelAutoRotation: 0
            labelFormat: ""
        }

        // Y axis
        axisY: ValueAxis3D {
            title: "b"
            titleVisible: true
            //segmentCount: 1
            min: 0
            max: b
            autoAdjustRange: false
            //labelAutoRotation: 0
            labelFormat: ""
        }

        // Z axis
        axisZ: ValueAxis3D {
            title: "c"
            titleVisible: true
            //segmentCount: 1
            min: 0
            max: c
            autoAdjustRange: false
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
            baseColor: "#408002"
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
            baseColor: "#FC6666"
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
            baseColor: "#FC6666"
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
            baseColor: "#0F80FF"
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

}
