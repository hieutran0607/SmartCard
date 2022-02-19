#include "connectdb.h"

connectDB::connectDB(QObject *parent) : QObject(parent)
{
    this->doConnect();
}

bool connectDB::doConnect()
{
    database = QSqlDatabase::addDatabase("QMYSQL");
    database.setHostName("localhost");
    database.setUserName("root");
    database.setPassword("");
    database.setDatabaseName("qtdatabase");
    if(database.open()){
        return true;
    } else {
        return false;
    }
}

bool connectDB::doLogin(QString username, QString password)
{
    QSqlQuery mysqlquery;
    mysqlquery.prepare("Select * from users where IDCard = :username and StudentCode = :password");
    mysqlquery.bindValue(":username",username);
    mysqlquery.bindValue(":password",password);
    mysqlquery.exec();
    return mysqlquery.next();
}

bool connectDB::doAdd(QString IDCard, QString NewHoTen, QString NewGioiTinh, QString NewMSV, QString NewTruong, QString NewQuyen, QString NewKhoa, QString NewPhone, QString NewEmail, QString NewAdress, QString NewDatebirth)
{
    QSqlQuery mysqlquery;
    mysqlquery.exec("select *from users");
    mysqlquery.prepare("INSERT INTO users (IDCard, FullName,Gender, DateOfBirth, StudentCode, University, Department, PhoneNumber, Email, Address, Position) "
                           "VALUES (?,?,?,?,?,?,?,?,?,?,?)");
    mysqlquery.addBindValue(IDCard);
    mysqlquery.addBindValue(NewHoTen);
    mysqlquery.addBindValue(NewGioiTinh);
    mysqlquery.addBindValue(NewDatebirth);
    mysqlquery.addBindValue(NewMSV);
    mysqlquery.addBindValue(NewTruong);
    mysqlquery.addBindValue(NewKhoa);
    mysqlquery.addBindValue(NewPhone);
    mysqlquery.addBindValue(NewEmail);
    mysqlquery.addBindValue(NewAdress);
    mysqlquery.addBindValue(NewQuyen);
    if(!mysqlquery.exec()){
            qDebug() << "error insert into ";
            qDebug() << mysqlquery.lastError().text();
            return false;
        } else {
            return true;
        }
    return false;
}

bool connectDB::doChange(QString IDCard, QString NewHoTen, QString NewGioiTinh, QString NewMSV, QString NewTruong, QString NewQuyen, QString NewKhoa, QString NewPhone, QString NewEmail, QString NewAdress, QString NewDatebirth)
{
    QSqlQuery mysqlquery;
    mysqlquery.prepare("UPDATE users "
                       "SET  FullName = (?),Gender = (?), DateOfBirth = (?), StudentCode = (?), University = (?), Department = (?), PhoneNumber = (?), Email = (?), Address = (?), Position = (?)"
                       "WHERE IDCard = (?)");
    mysqlquery.addBindValue(NewHoTen);
    mysqlquery.addBindValue(NewGioiTinh);
    mysqlquery.addBindValue(NewDatebirth);
    mysqlquery.addBindValue(NewMSV);
    mysqlquery.addBindValue(NewTruong);
    mysqlquery.addBindValue(NewKhoa);
    mysqlquery.addBindValue(NewPhone);
    mysqlquery.addBindValue(NewEmail);
    mysqlquery.addBindValue(NewAdress);
    mysqlquery.addBindValue(NewQuyen);
    mysqlquery.addBindValue(IDCard);
    if(!mysqlquery.exec()){
            qDebug() << "error change into ";
            qDebug() << mysqlquery.lastError().text();
            return false;
        } else {
            return true;
        }
    return false;
}

bool connectDB::doDelete(QString IDCard)
{
    QSqlQuery mysqlquery;
    mysqlquery.exec("select *from users");
    mysqlquery.prepare("delete from users  "
                       "where IDCard = (?)");
    mysqlquery.addBindValue(IDCard);
    if(!mysqlquery.exec()){
            qDebug() << "error delete into ";
            qDebug() << mysqlquery.lastError().text();
            return false;
        } else {
            return true;
        }
    return false;
}

void connectDB::Check_In(QSqlQuery &mysqlquery, QString IDCard)
{
    mysqlquery.prepare("INSERT INTO `History` (IDCard, TimeIn, `Status`)"
                       "VALUE (?, now(), 'Online')");
    mysqlquery.addBindValue(IDCard);
    mysqlquery.exec();
}

void connectDB::Check_Out(QSqlQuery &mysqlquery, QString IDCard)
{
    mysqlquery.prepare("UPDATE `History`"
                       "SET TimeOut = now(), `Status` = 'Disable' "
                       "WHERE IDCard = ? "
                       "AND `Status` = 'Online'");
    mysqlquery.addBindValue(IDCard);
    mysqlquery.exec();
}

void connectDB::List_Member_Online(QSqlQuery &mysqlquery)
{
    mysqlquery.exec("SELECT users.IDCard, users.FullName, `History`.`Status`"
                    "FROM users, `History`"
                    "WHERE users.IDCard = `History`.IDCard AND `History`.`Status` = 'Online'");
}

void connectDB::Check_History(QSqlQuery &mysqlquery, QString TimeCheck)
{
    QString TimeStart(" 00:00:00");
    QString TimeEnd(" 23:59:59");
    QString TimeStartDay = TimeCheck + TimeStart;
    QString TimeEndDay = TimeCheck + TimeEnd;
    mysqlquery.prepare("SELECT *FROM `History`"
                       "WHERE TimeIn BETWEEN ? AND ? ");
    mysqlquery.addBindValue(TimeStartDay);
    mysqlquery.addBindValue(TimeEndDay);
    mysqlquery.exec();
}

