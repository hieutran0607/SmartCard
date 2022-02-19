#ifndef WAITERMODEL_H
#define WAITERMODEL_H

#include <QObject>
#include "connectdb.h"
class WaiterModel : public QSqlQueryModel
{
    Q_OBJECT
public:
    explicit WaiterModel(QObject *parent = nullptr);

signals:
public slots:
    void updateModel();
};

#endif // WAITERMODEL_H
