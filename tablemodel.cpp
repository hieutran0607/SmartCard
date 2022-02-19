#include "tablemodel.h"

TableModel::TableModel(QObject *parent) : QSqlQueryModel(parent)
{
    this->updateModel();
}
// The method for obtaining data from the model
QVariant TableModel::data(const QModelIndex &index, int role) const
{
    // Define the column number, on the role of number
    int columnId = role - Qt::UserRole - 1;
    // Create the index using a column ID
    QModelIndex modelIndex = this->index(index.row(), columnId);

    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

QHash<int, QByteArray> TableModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[IdCard] = "IDCard";
    roles[FNameRole] = "Full Name";
    roles[GenderRole] = "Gender";
    roles[DateBirthRole] = "Date Of Birth";
    roles[StudentCodeRole] = "StudentCode";
    roles[UniversityRole] = "University";
    roles[DepartmentRole] = "Department";
    roles[PhoneNumberRole] = "PhoneNumber";
    roles[EmailRole] = "Email";
    roles[AddressRole] = "Address";
    roles[Position] = "Position";
    return roles;
}

void TableModel::updateModel()
{
    this->setQuery("SELECT * FROM users");
}

int TableModel::getId(int row)
{
    return this->data(this->index(row, 0), IdCard).toInt();
}

