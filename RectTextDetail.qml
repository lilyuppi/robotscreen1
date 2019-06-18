import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQuick.Controls 1.0
Rectangle{
    id: rectTextDetail
    anchors.left: rectContainImg.right
    anchors.top: rectTextTitle.bottom
    anchors.topMargin: 5
    width: sizeDisplay.width - rectContainImg.width
    height: sizeDisplay.height
    color: "#ffffff"
    radius: 3

    Text {
        id: textDetail
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        width: parent.width - 20
        wrapMode: Text.WordWrap
        font.pixelSize: 14
        font.family: textTitle.font.family
        text: DataJson.textDetail
    }
    layer.enabled: true
    layer.effect: DropShadow {
        horizontalOffset: -0.3
        samples: 25
        radius: 5
        color: "#7f8c8d"
    }
}
