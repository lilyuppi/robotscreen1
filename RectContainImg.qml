import QtQuick 2.0
Rectangle{
    id: rectContainImg
    anchors.topMargin: 20
    property var src_img_detail_from_json: ""
    property int num_of_img: 0
    Rectangle {
        id: rectContainPath
        width: parent.width
        height: parent.height

        PathView {
            id: view
            anchors.fill: parent
            model: ItemPathImageDetail{
                id: listImgPath
            }

            pathItemCount: num_of_img
//                pathItemCount: 2
            path: Path {
                startX: -rectContainPath.width / 2
                startY: view.height / 2

                PathLine {
                    x: rectContainPath.width * num_of_img - rectContainPath.width / 2
                    y: view.height / 2
                }

            }
            delegate: Rectangle {
                width: rectContainPath.width
                height: rectContainPath.height
                color: rectContainImg.color
                Image {
                    id: imgDetailPath
                    width: parent.width
                    height: parent.height
                    fillMode: Image.PreserveAspectFit
                    source: srcImgDetailFromJson
                }
            }
        }
    }
    function updateData(){
        listImgPath.clear()
        for(var i = 0; i < DataJson.numImgDetail; i++){
            listImgPath.append({
                        srcImgDetailFromJson: DataJson.listImgDetail[i]
                                  });
        }
    }
}

