import QtQuick 2.0
import QtGraphicalEffects 1.0
Item{
    id: root
    property size sizeHeader: Qt.size(1920, 40)
    width: parent.width
    height: sizeHeader.height
    function showBtnBack(){
        showBtnBackAnim.start()
        btnBack.visible = true
    }

    function hideBtnBack(){
        btnBack.visible = false
    }

    function hideQuickMenu(){
        quickMenu.visible = false
    }

    signal clickBtnBack()
    MouseArea{
        anchors.fill: parent
        onClicked: {
            quickMenu.close()
            quickMenu.visible = false
        }
    }
    Rectangle{
        id: header
        width: sizeHeader.width
        height: sizeHeader.height
        color: "#1976d2"
        layer.enabled: true
        layer.effect: DropShadow {
            verticalOffset: 1
            samples: 50
            radius: 20
            color: "#7f8c8d"
        }
        Rectangle {
            id: btnBack
            visible: true
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            height: textTimeAndDate.height
            width: imgBack.width + 20
            radius: 4
            color: "white"
            Image {
                id: imgBack
                anchors.left: parent.left
                anchors.leftMargin: 10
                height: parent.height
                width: height
                fillMode: Image.PreserveAspectFit
                source: "file:/" + DataJson.dirApp() + "/img/" + "back"+ ".png"
            }
            layer.enabled: true
            layer.effect: DropShadow{
                verticalOffset: 0.5
                horizontalOffset: 0.5
                samples: 20
                radius: 1
                color: "#7f8c8d"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    root.clickBtnBack()
                }
            }
            ParallelAnimation{
                id: showBtnBackAnim
                NumberAnimation {
                    target: btnBack
                    property: "opacity"
                    duration: 500
                    from: 0
                    to: 1
                    easing.type: Easing.InOutQuad
                }

                NumberAnimation {
                    target: btnBack
                    property: "width"
                    duration: 500
                    from: 0
                    to: btnBack.width
                    easing.type: Easing.InOutQuad
                }
            }
            ParallelAnimation{
                id: hideBtnBackAnim
            }
        }
        Text {
            id: textTimeAndDate
//            anchors.right: parent.right
//            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 24
            font.weight: Font.Bold
            color: "white"
            text: getTimeAndDate.hours + ':' + getTimeAndDate.minutes
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    quickMenu.visible = !quickMenu.visible
                    if(quickMenu.visible){
                        quickMenu.open()

                    }else{
                        quickMenu.close()
                    }
                }
            }
        }
        GetTimeAndDate{
            id: getTimeAndDate
        }

    }

    QuickMenu{
        id: quickMenu
        width: window.width/3
        height: window.height/3
        anchors.horizontalCenter: root.horizontalCenter
        anchors.top: header.bottom
        anchors.topMargin: 10
        color: "#1976d2"
        visible: false
        radius: 2
        layer.enabled: true
        layer.effect: DropShadow {
            verticalOffset: 1
            samples: 20
            radius: 5
            color: "#7f8c8d"
        }
    }

}

