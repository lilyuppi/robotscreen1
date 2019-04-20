#include "recttextdetail.h"

RectTextDetail::RectTextDetail(QObject *parent)
    : QAbstractItemModel(parent)
{
}

QVariant RectTextDetail::headerData(int section, Qt::Orientation orientation, int role) const
{
    // FIXME: Implement me!
}

QModelIndex RectTextDetail::index(int row, int column, const QModelIndex &parent) const
{
    // FIXME: Implement me!
}

QModelIndex RectTextDetail::parent(const QModelIndex &index) const
{
    // FIXME: Implement me!
}

int RectTextDetail::rowCount(const QModelIndex &parent) const
{
    if (!parent.isValid())
        return 0;

    // FIXME: Implement me!
}

int RectTextDetail::columnCount(const QModelIndex &parent) const
{
    if (!parent.isValid())
        return 0;

    // FIXME: Implement me!
}

QVariant RectTextDetail::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    // FIXME: Implement me!
    return QVariant();
}
