import QtQuick 2.0
import QtGraphicalEffects 1.0
Rectangle{
    width: textButton.width + img.width + 40
    radius: height/2
    color: "#03A9F4"
    property var img_src: "name"
    property var textIn: "value"
    Image {
        id: img
        width: parent.height - 10
        height: width
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        source: "file:/" + DataJson.dirApp() + "/img/" + img_src+ ".png"
    }
    Text {
        id: textButton
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: img.right
        anchors.leftMargin: 10
        font.pixelSize: parent.height / 2.8
        font.weight: Font.Black
        color: "white"
        text: textIn
    }
    layer.enabled: true
    layer.effect: DropShadow{
        verticalOffset: 1
        horizontalOffset: 1
        samples: 50
        radius: 10
        color: "#7f8c8d"
    }
}
