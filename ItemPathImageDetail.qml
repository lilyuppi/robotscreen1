import QtQuick 2.0

ListModel {
    id: list
    Component.onCompleted: {
    }
    function updateListImg(){
        DataJson.readListImgDetail()
        var i
        for(i = 0; i < DataJson.numImgDetail; i++){
            list.append({
                                      xcolor: "red"
                                  });
        }
    }
}
