import QtQuick 2.0

GridView{
    id: listItem

    anchors.topMargin: 80
    anchors.leftMargin: 64
    anchors.fill: parent
    cellWidth: 464
    cellHeight: 500

    flow: GridView.FlowTopToBottom
    model: ListModel{}

    delegate: Rectangle{
        width: 400
        height: 400
        radius: 20
        color: "white"
        layer.enabled: true
        layer.effect: DropShadow{
            verticalOffset: 1
            horizontalOffset: 1
            samples: 50
            radius: 10
            color: "#7f8c8d"
        }
    }
}
