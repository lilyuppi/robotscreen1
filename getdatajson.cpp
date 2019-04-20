#include "getdatajson.h"
DataJson::DataJson(QObject *parent) : QObject(parent), m_numItem(-1), m_indexItem(-1){
    readJson();
}



QJsonDocument DataJson::openFileJson(QString dirFile){
    QFile file;
    file.setFileName(dirFile);
    file.open(QIODevice::ReadOnly | QIODevice::Text);
    QJsonParseError jsonError;
    QJsonDocument recieveJson = QJsonDocument::fromJson(file.readAll(),&jsonError);
    if (jsonError.error != QJsonParseError::NoError){
        qDebug() << jsonError.errorString();
    }
    file.close();
    return recieveJson;
}



void DataJson::readJson()
{
    qDebug() << QDir::currentPath();
    //    QList<QVariant> list = recieveJson.toVariant().toList();
    //    QMap<QString, QVariant> map = list[0].toMap();
    //    qDebug() << map["tittle"].toString();
    //    qDebug() << map["tittle"];
    m_recieveJson = openFileJson(m_dirFileJson);
    QList<QVariant> list = m_recieveJson.toVariant().toList();
    setNumItem(list.length());
    QList<QString> temp_listTitle, temp_listSrcThum;
    for(int i = 0; i < list.length(); i++){
        QMap<QString, QVariant> map = list[i].toMap();
        temp_listTitle.append(map["title"].toString());
        temp_listSrcThum.append(map["thumbnail"].toString());
    }
    setListTitle(temp_listTitle);
    setListSrcThum(temp_listSrcThum);
//    for(int i = 0; i < list.length(); i++){
//        QMap<QString, QVariant> map = list[i].toMap();
//        qDebug() << map["tittle"].toString();
//    }
    qDebug() << temp_listSrcThum;
}


void DataJson::readTextDetail()
{
    QFile file;
    QString tmp_index = QString::number(m_indexItem);
    QString fileName_tmp = m_dirApp + "/data/" + tmp_index +"/detail.txt";
//    qDebug() << tmp_index;
//    qDebug() << fileName_tmp;
    file.setFileName(fileName_tmp);
    if(!file.open(QIODevice::ReadOnly)){
        qDebug() << "Error in load file text detail";
    }
    QTextStream in(&file);
    QString tmp_textDetail = in.readAll();
    qDebug() << tmp_textDetail;
    setTextDetail(tmp_textDetail);
}

void DataJson::readListImgDetail()
{
    QString tmp_index = QString::number(m_indexItem);
    QString dir_tmp = m_dirApp + "/data/" + tmp_index + "/img";
    QDir directory(dir_tmp);
    qDebug() << dir_tmp;
    QStringList list_tmp;
    QStringList images = directory.entryList(QStringList() << "*.jpg" << "*.JPG" << "*.png" << "*.jpeg",QDir::Files);
    foreach(QString filename, images) {
    //do whatever you need to do
        qDebug() << filename;
        list_tmp.append("file:/" + dir_tmp + '/' + filename);
    }
    qDebug() << list_tmp << list_tmp.length();
    setNumImgDetail(list_tmp.length());
    setListImgDetail(list_tmp);
}


QString DataJson::dirApp()
{
    return m_dirApp;
}


//QString DataJson::imgPreDetail()
//{
//    if(m_listImgDetail.length() == 0){
//        return ("file:/" + m_dirApp + "/img/default.png");
//    }
//    qDebug() << "set" <<m_listImgDetail[preImgDetailPos];
//    return m_listImgDetail[preImgDetailPos];
//}


int DataJson::numItem(){
    return m_numItem;
}

QList<QString> DataJson::listTitle()
{
    return m_listTitle;
}

QList<QString> DataJson::listSrcThum()
{
    return m_listSrcThum;
}

QString DataJson::textDetail()
{
    return m_textDetail;
}



void DataJson::setNumItem(const int &numItem)
{
    if(m_numItem != numItem){
        m_numItem = numItem;
        emit numItemChanged();
    }
}

QStringList DataJson::listImgDetail() const
{
    return m_listImgDetail;
}

int DataJson::numImgDetail() const
{
    return m_numImgDetail;
}


int DataJson::indexItem() const
{
    return m_indexItem;
}

void DataJson::setIndexItem(const int &indexItem)
{
    if (m_indexItem == indexItem)
        return;

    m_indexItem = indexItem;
    readTextDetail();   
    readListImgDetail();
    emit indexItemChanged(m_indexItem);
}

void DataJson::setListImgDetail(QStringList listImgDetail)
{
    if (m_listImgDetail == listImgDetail)
        return;

    m_listImgDetail = listImgDetail;
    emit listImgDetailChanged(m_listImgDetail);
}


void DataJson::setNumImgDetail(int numImgDetail)
{
    if (m_numImgDetail == numImgDetail)
        return;

    m_numImgDetail = numImgDetail;
    emit numImgDetailChanged(m_numImgDetail);
}

void DataJson::setListTitle(const QList<QString> &listTitle)
{
    if(m_listTitle != listTitle){
        m_listTitle = listTitle;
        emit listTitleChanged();
    }
}

void DataJson::setListSrcThum(const QList<QString> &listSrcThum)
{
    if(m_listSrcThum != listSrcThum){
        m_listSrcThum = listSrcThum;
        emit listSrcThumChanged();
    }
}

void DataJson::setTextDetail(const QString &textDetail)
{
    if(m_textDetail != textDetail){
        m_textDetail = textDetail;
        emit textDetailChanged();
    }
}




