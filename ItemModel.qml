import QtQuick 2.0

ListModel{
    id: listItemModel
    Component.onCompleted: {
        DataJson.readJson()
        var i
        for(i = 0; i < DataJson.numItem; i++){
            var srcThum = "file:/" + DataJson.dirApp() + DataJson.listSrcThum[i]
            listItem.model.append({
                                      titleFromJson : DataJson.listTitle[i],
                                      srcThumFromJson : srcThum
                                  });
        }
    }
}
