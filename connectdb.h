#ifndef CONNECTDB_H
#define CONNECTDB_H

#include <QObject>
#include <QtSql>
#include <QtSql/QSqlDatabase>

class connectDB : public QObject
{
    Q_OBJECT
public:
    explicit connectDB(QObject *parent = nullptr);
    bool doConnect();
    Q_INVOKABLE bool doLogin(QString username, QString password);
    Q_INVOKABLE bool doAdd(QString IDCard, QString NewHoTen, QString NewGioiTinh, QString NewMSV, QString NewTruong, QString NewQuyen, QString NewKhoa, QString NewPhone, QString NewEmail, QString NewAdress, QString NewDatebirth);
    Q_INVOKABLE bool doChange(QString IDCard, QString NewHoTen, QString NewGioiTinh, QString NewMSV, QString NewTruong, QString NewQuyen, QString NewKhoa, QString NewPhone, QString NewEmail, QString NewAdress, QString NewDatebirth);
    Q_INVOKABLE bool doDelete(QString IDCard);
    void Check_In(QSqlQuery &mysqlquery, QString IDCard);
    void Check_Out(QSqlQuery &mysqlquery, QString IDCard);
    void List_Member_Online(QSqlQuery &mysqlquery);
    void Check_History(QSqlQuery &mysqlquery, QString TimeCheck);
signals:
private:
    QSqlDatabase database;
};

#endif // CONNECTDB_H
