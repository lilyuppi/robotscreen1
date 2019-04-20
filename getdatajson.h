#ifndef GETDATAJSON_H
#define GETDATAJSON_H
#include <QFile>
#include <QTextStream>
#include <QJsonDocument>
#include <QJsonObject>
#include <QString>
#include <QDebug>
#include <QJsonArray>
#include <QList>
#include <QObject>
#include <QQmlEngine>
#include <QDir>
class DataJson : public QObject{
    Q_OBJECT
    Q_PROPERTY(int numItem READ numItem WRITE setNumItem NOTIFY numItemChanged)
    Q_PROPERTY(int numImgDetail READ numImgDetail WRITE setNumImgDetail NOTIFY numImgDetailChanged)
    Q_PROPERTY(QList<QString> listTitle READ listTitle WRITE setListTitle NOTIFY listTitleChanged)
    Q_PROPERTY(QList<QString> listSrcThum READ listSrcThum WRITE setListSrcThum NOTIFY listSrcThumChanged)
    Q_PROPERTY(QString textDetail READ textDetail WRITE setTextDetail NOTIFY textDetailChanged)
    Q_PROPERTY(int indexItem READ indexItem WRITE setIndexItem NOTIFY indexItemChanged)
    Q_PROPERTY(QStringList listImgDetail READ listImgDetail WRITE setListImgDetail NOTIFY listImgDetailChanged)
public:
    explicit DataJson(QObject *parent = 0);

    QJsonDocument openFileJson(QString dirFile);
    Q_INVOKABLE void readJson();
    Q_INVOKABLE QString dirApp();
    int numItem();
    int indexItem() const;

    QList<QString> listTitle();
    QList<QString> listSrcThum();
    QString textDetail();

    void readTextDetail();
    Q_INVOKABLE void readListImgDetail();
    void setListTitle(const QList<QString> &listTitle);
    void setListSrcThum(const QList<QString> &listSrcThum);
    void setTextDetail(const QString &textDetail);
    void setNumItem(const int &numItem);

    QStringList listImgDetail() const;

    int numImgDetail() const;

signals:
    void numItemChanged();
    void listTitleChanged();
    void listSrcThumChanged();
    void textDetailChanged();
    void indexItemChanged(int indexItem);

    void listImgDetailChanged(QStringList listImgDetail);
    void numImgDetailChanged(int numImgDetail);

public slots:
    void setIndexItem(const int &indexItem);

    void setListImgDetail(QStringList listImgDetail);

    void setNumImgDetail(int numImgDetail);

private:
    QString m_dirApp = QDir::currentPath();
    QString m_dirFileJson = m_dirApp + "/data/data.json";
    QJsonDocument m_recieveJson;
    int m_numItem;
    QList<QString> m_listTitle;
    QList<QString> m_listSrcThum;
    QString m_textDetail;
    int m_indexItem;
    QStringList m_listImgDetail;
    int m_numImgDetail;
};


#endif // GETDATAJSON_H
