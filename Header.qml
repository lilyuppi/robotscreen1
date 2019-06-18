import QtQuick 2.0
import QtGraphicalEffects 1.0

Rectangle{
    property size sizeHeader: Qt.size(1920, 40)

    width: sizeHeader.width
    height: sizeHeader.height
    layer.enabled: true
    layer.effect: DropShadow {
        verticalOffset: 1
        samples: 50
        radius: 20
        color: "#7f8c8d"
    }
    Text {
        id: textTimeAndDate
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: 24
//        font.weight: Font.Black
        text: getTimeAndDate.hours + ':' + getTimeAndDate.minutes
    }
    GetTimeAndDate{
        id: getTimeAndDate
    }
    QuickMenu{
        id: quickMenu
        width: 100
        height: 100
        anchors.right: parent.right
        anchors.top: parent.top
        visible: false
    }

    MouseArea{
        anchors.fill: parent
        onClicked: {
            quickMenu.visible = !quickMenu.visible
        }
    }
}
