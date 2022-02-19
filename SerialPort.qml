import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
Page {
    id: window
    width: rootWindow.width
    height: rootWindow.height
    background: Rectangle {
        color: backGroundColor
    }
    title: qsTr("COM")
    property alias connectBtn: connectBtn
    property alias serialPorts: serialPorts
    property alias baudRate: baudRate
    header: ToolBar {
        background:
            Rectangle {
            implicitHeight: 50
            implicitWidth: 200
            color: "transparent"
        }
        RowLayout {
            anchors.fill: parent
            ToolButton {
                id: toolButton_1
                text: "\u2630"
                font.pixelSize: Qt.application.font.pixelSize * 1.6
                onClicked: {
                    drawer.open()
                }
            }
            Label {
                text: stackView.currentItem.title
                Layout.fillWidth: true
            }
            ToolButton {
                id: control
                font.family: "fontawesome"
                text: qsTr("\uf08b")
                font.pointSize: 30
                rightPadding: 10
                contentItem: Text {
                    text: control.text
                    font: control.font
                    opacity: enabled ? 1.0 : 0.3
                    color: mainTextCOlor
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }
                onClicked: logoutSession()
            }
        }
    }

    Drawer {
        id: drawer
        width: window.width * 0.66
        height: window.height

        Column {
            anchors.fill: parent

            ItemDelegate {
                text: qsTr("Quản lý")
                width: parent.width
                onClicked: {
                    stackView.push("QuanLy.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("Nhật ký")
                width: parent.width
                onClicked: {
                    stackView.push("NhatKy.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("Hàng đợi")
                width: parent.width
                onClicked: {
                    stackView.push("HangDoi.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("COM")
                width: parent.width
                onClicked: {
                    stackView.push("SerialPort.qml")
                    drawer.close()
                }
            }
        }
    }
    Row{
        anchors.centerIn: parent
        spacing: 20
        Column{
            Label{
                text: qsTr("Serial  Port:")
            }
            ComboBox{
                id: serialPorts
                width: 100
                height: 40
                model: portsNameModel
            }
            Label{
                text: qsTr("Baudrate: ")
            }
            ComboBox{
                id: baudRate
                width: 100
                height: 40
                model: baudsModel
            }
            Label{
                text: qsTr("Data Bits:")
            }
            ComboBox{
                id: dataBit
                width: 100
                height: 40
                model: ["5","6","7","8"]
            }
            Button{
                id: connectBtn
                text: qsTr("Connect")
                onClicked: {
                    if (serialTerminal.getConnectionStatusSlot() === false){
                        serialTerminal.openSerialPortSlot(serialPorts.currentText,baudRate.currentText)
                        connectBtn.text = "Disconnect"
                    }else {

                        serialTerminal.closeSerialPortSlot();
                        connectBtn.text = "Connect"
                    }
                }
            }
        }
        Column{
            Label{
                text: qsTr("Parity:")
            }
            ComboBox{
                id: parity
                width: 100
                height: 40
                model: ["No","Even","Odd","Mark","Space"]
            }
            Label{
                text: qsTr("Stop Bits:")
            }
            ComboBox{
                id: stopBit
                width: 100
                height: 40
                model:["One","OneHalf","Two"]
            }
            Label{
                text: qsTr("Flow Control:")
            }
            ComboBox{
                id: flowControl
                width: 100
                height: 40
                model: ["None","Hard","Soft"]
            }
        }
    }

}
