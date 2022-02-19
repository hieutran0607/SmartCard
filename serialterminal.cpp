#include "serialterminal.h"

SerialTerminal::SerialTerminal(QObject *parent) : QObject(parent)
{
    serialPort = new QSerialPort(this);
}
void SerialTerminal::openSerialPort(QString comName, int baud){

    serialPort->setPortName(comName);
    serialPort->setBaudRate(baud);
    serialPort->setFlowControl(QSerialPort::NoFlowControl);
    serialPort->setDataBits(QSerialPort::Data8);
    serialPort->setStopBits(QSerialPort::OneStop);
    serialPort->setParity(QSerialPort::NoParity);
    serialPort->open(QIODevice::ReadWrite);
    connect(serialPort,SIGNAL(readyRead()),this,SLOT(serialport_read()));
}

void SerialTerminal::closeSerialPort(){

    serialPort->close();

}

void SerialTerminal::serialport_read()
{
    QString tinHieu="0";
    QString in,an;
    QByteArray data = (serialPort->readAll());
    connectDB connectDB;
    qDebug() << data;
    char *str = data.data();
    char chot = *str;
    //    qDebug() << chot;
    if(chot == '}')
    {
        arr[count] = chot;
        count++;
        arr[count] = NULL;
        qDebug() << "vao";
        QString Json=arr;
        qDebug() << Json;
        QByteArray Json_Array=Json.toUtf8();
        QJsonDocument d=QJsonDocument::fromJson(Json_Array);
        QJsonObject sett2 = d.object();
        QJsonValue Data=sett2.value(QByteArray("ID"));
        in = Data.toString().toUtf8();
        qDebug() << in;
        count = 0;
        QSqlQuery qry;
        QString stsm = "select * from users";
        qry.prepare(stsm);
        if(qry.exec()){
            while (qry.next()) {//laays hang tiep theo cho den khi het hang, .value(int) se lay gia tri cua cac truong trong hang dang chon
                an= (qry.value(0).toString().toUtf8());
                //                qDebug() << an;
                if(in==an){
                    QSqlQuery mysqlquery_his;
                    QString N_card,N_name,N_MSV,N_Truong,H_Status;
                    N_card=qry.value(0).toString().toUtf8();
                    N_name=qry.value(1).toString().toUtf8();
                    N_MSV=qry.value(5).toString().toUtf8();
                    N_Truong=qry.value(6).toString().toUtf8();
                    mysqlquery_his.prepare("SELECT *FROM `History`"
                                           "WHERE IDCard = ?");
                    H_Status = mysqlquery_his.value(3).toString().toUtf8();
                    if(H_Status == "Disable") connectDB.Check_In(mysqlquery_his, N_card);
                    else connectDB.Check_Out(mysqlquery_his,N_card);
                    //                    qDebug() << N_card << N_name;
                    QJsonObject object;
                    object.insert("card",N_card);
                    object.insert("name",N_name);
                    object.insert("msv",N_MSV);
                    object.insert("school",N_Truong);
                    QJsonDocument doc(object);
                    QString strJson(doc.toJson(QJsonDocument::Compact));
//                    qDebug() << strJson.toStdString().data();
                    serialPort->write(strJson.toStdString().data());
                    tinHieu="1";
                    //                    qDebug() << tinHieu;
                    break;
                }
            }
            if(tinHieu == "0"){
                QString not_in = "Not in database";
                QSqlQuery mysqlquery_wai;
                QString N_Id = in;
                //                qDebug() << N_Id;
                mysqlquery_wai.exec("select *from waiters");
                mysqlquery_wai.prepare("INSERT INTO waiter (IDCard) "
                                   "VALUES (?)");
                mysqlquery_wai.addBindValue(N_Id);
                mysqlquery_wai.exec();
                QJsonObject object_2;
                object_2.insert("card",not_in);
                object_2.insert("name",not_in);
                object_2.insert("msv",not_in);
                object_2.insert("school",not_in);
                QJsonDocument doc(object_2);
                QString strJson(doc.toJson(QJsonDocument::Compact));
                qDebug() << strJson.toStdString().data();
                serialPort->write(strJson.toStdString().data());
            }
        }
    }

    else
    {
        arr[count] = chot;
        count++;

    }
}


void SerialTerminal::openSerialPortSlot(QString comName, int baud){

    this->openSerialPort(comName,baud);
}

void SerialTerminal::closeSerialPortSlot(){

    this->closeSerialPort();
}
bool SerialTerminal::getConnectionStatus(){

    return serialPort->isOpen();

}
bool SerialTerminal::getConnectionStatusSlot(){

    return this->getConnectionStatus();
}
