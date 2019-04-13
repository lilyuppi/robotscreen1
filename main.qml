import QtQuick 2.9
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0
//import Qt.labs.controls.material 1.0
Window {
    property size sizeDisplay: Qt.size(1920, 1080)
    visibility: "FullScreen"
    visible: true
    width: sizeDisplay.width
    height: sizeDisplay.height
    color: "#e9ebee"


    Rectangle {
        width: parent.width
        height: parent.height
        opacity: 0
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#C3CFE2" }
            GradientStop { position: 1.0; color: "#cfd8dc" }
        }
        layer.enabled: true
        layer.effect: InnerShadow{
            verticalOffset: 1
            samples: 50
            radius: 20
        }
    }
    GridView{
        id: listItem

        anchors.topMargin: 120
        anchors.leftMargin: 64
        anchors.fill: parent
        cellWidth: 464
        cellHeight: 480

        flow: GridView.FlowTopToBottom
        model: ItemModel{}
        snapMode: ListView.SnapOneItem
        delegate: Rectangle{
            width: 400
            height: 400
            radius: 20
            color: "white"
            Image {
                id: imgThumbnail
                width: parent.width
                height: parent.height - 50
                asynchronous: true
                source: srcThumFromJson


                layer.enabled: true
                layer.effect: OpacityMask{
                    maskSource: Item{
                        width: imgThumbnail.width
                        height: imgThumbnail.height
                        Rectangle{
                            anchors.centerIn: parent
                            width: parent.width
                            height: parent.height
                            radius: 20
                        }
                    }
                }
            }

            Rectangle{
                id: rectOverrideImg
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 50
                width: parent.width
                height: 20
                color: parent.color
            }
            Rectangle{
                id: rectTextTitle
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                width: parent.width
                height: 70
                color: "transparent"
                Text{
                    horizontalAlignment: Text.AlignHCenter
                    anchors.top: parent.top
                    anchors.topMargin: 5
                    width: parent.width
                    wrapMode: Text.WordWrap
                    font.family: "San Francisco"
                    text: titleFromJson
                }
            }
            layer.enabled: true
            layer.effect: DropShadow{
                verticalOffset: 1
                horizontalOffset: 1
                samples: 50
                radius: 10
                color: "#7f8c8d"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    console.log(index)
                    DataJson.setIndexItem(index)
                    detailItem.visible = true
                    detailItem.enabled = true
                    detailItem.updateData()
                    detailItemShow.start()
                }
            }
        }

        ParallelAnimation{
            id: detailItemShow
            NumberAnimation{
                target: detailItem
                properties: "x"
                from: sizeDisplay.width
                to: 0
                easing.type: Easing.OutCubic
                duration: 800
            }
        }
    }

    DetailItem{
        id: detailItem
        x: sizeDisplay.width
        visible: {
            detailItem.x < sizeDisplay.width ? true : false
        }

    }

    Header{

    }
}
