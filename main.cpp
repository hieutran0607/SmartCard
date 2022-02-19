#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "tablemodel.h"
#include "connectdb.h"
#include "serialterminal.h"
#include "waitermodel.h"
int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    connectDB connectDB;
    TableModel *tableModel = new TableModel();
    WaiterModel *waiterModel = new WaiterModel();
    SerialTerminal serialTerminal;
    QSerialPortInfo serialPortInfo;
    QList<QSerialPortInfo> ports = serialPortInfo.availablePorts();
    QList<qint32> bauds = serialPortInfo.standardBaudRates();
    QStringList portsName;
    QStringList baudsStr;


    foreach (QSerialPortInfo port, ports) {

        portsName.append(port.portName());

    }

    foreach (qint32 baud, bauds) {

        baudsStr.append(QString::number(baud));

    }
    engine.rootContext()->setContextProperty("connectDB", &connectDB);
    engine.rootContext()->setContextProperty("myUserModel", tableModel);
    engine.rootContext()->setContextProperty("WaiterModel", waiterModel);
    engine.rootContext()->setContextProperty("serialTerminal",&serialTerminal);
    engine.rootContext()->setContextProperty("portsNameModel",QVariant::fromValue(portsName));
    engine.rootContext()->setContextProperty("baudsModel",QVariant::fromValue(baudsStr));
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
