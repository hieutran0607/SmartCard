import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.1

Page {
    id: window
    width: rootWindow.width
    height: rootWindow.height
    background: Rectangle {
        color: backGroundColor
    }
    title: qsTr("Nhật ký")
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
}
