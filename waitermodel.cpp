#include "waitermodel.h"

WaiterModel::WaiterModel(QObject *parent) : QSqlQueryModel(parent)
{
    this->updateModel();
}

void WaiterModel::updateModel()
{
    this->setQuery("select *from waiter");
}
