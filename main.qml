import QtQuick 2.0
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0
//import Qt.labs.controls.material 1.0
Window {
    id: window
    property size sizeDisplay: Qt.size(1920, 1080)
    property int heightHeader: 40
    visibility: "FullScreen"
    width: sizeDisplay.width
    height: sizeDisplay.height
    visible: true
//    color: "#e9ebee"
    color: "#ffffff"
    MouseArea{
        anchors.fill: parent
        onClicked: {
            header.hideQuickMenu()
        }
    }

    Rectangle{
        id: mainHome
        width: window.width
        height: window.height
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
            anchors.topMargin: window.height / 9
            anchors.leftMargin: window.width / 30
            anchors.fill: parent
            // cellWidth: 464 = 1920 / 4,137931034
            cellWidth: window.width / 4.137931034
    //        cellHeight: 480
            cellHeight: (window.height - heightHeader)  / 2.35
            flow: GridView.FlowTopToBottom
            model: ItemModel{}
            snapMode: ListView.SnapOneItem
            delegate: Rectangle{
                width: window.width / 4.8
                height: width
                radius: 20
                color: "white"
                Image {
                    id: imgThumbnail
                    width: parent.width
                    height: parent.height - parent.width / 8
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
                    anchors.bottomMargin: parent.width / 8
                    width: parent.width
                    height: 20
                    color: parent.color
                }
                Rectangle{
                    id: rectTextTitle
                    anchors.left: parent.left
                    anchors.bottom: parent.bottom
                    width: parent.width
                    height: parent.height / 5.7
                    color: "transparent"
                    Text{
                        horizontalAlignment: Text.AlignHCenter
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        width: parent.width
                        wrapMode: Text.WordWrap
                        FontLoader { id: myCustomFont; source: "qrc:/fonts/Lora-Regular.ttf" }
                        font.family: myCustomFont.name
                        font.pixelSize: parent.height / 3
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
            sizeDisplay: Qt.size(window.width, window.height)
            x: window.width
        }
    }

    Header{
        id: header
        sizeHeader: Qt.size(window.width, heightHeader)
        anchors.top: parent.top
        anchors.left: parent.left
        onClickBtnBack: {
            detailItem.backHome()
        }
        Component.onCompleted: {
            header.hideBtnBack()
        }
    }


}
