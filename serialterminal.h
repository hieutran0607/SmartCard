#ifndef SERIALTERMINAL_H
#define SERIALTERMINAL_H

#include <QObject>
#include <QSerialPort>
#include <QSerialPortInfo>
#include "connectdb.h"
class SerialTerminal : public QObject
{
    Q_OBJECT
public:
    explicit SerialTerminal(QObject *parent = nullptr);
    void openSerialPort(QString comName, int baud);
    void closeSerialPort();
    bool getConnectionStatus();
public slots:
    void serialport_read();
    void openSerialPortSlot(QString comName, int baud);
    void closeSerialPortSlot();
    bool getConnectionStatusSlot();
private:
    QByteArray serialData;
    QSerialPort *serialPort;
    int count = 0;
    char arr[50];
};

#endif // SERIALTERMINAL_H
