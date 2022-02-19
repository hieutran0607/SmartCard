import QtQuick 2.7
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
Page {
    id: deletePage
    background: Rectangle {
        color: backGroundColor
    }
    Row{
        anchors.fill: parent
        TextField {
            id: card
            placeholderText: qsTr("Card")
            Layout.preferredWidth: parent.width - 20
            Layout.alignment: Qt.AlignHCenter
            color: mainTextCOlor
            font.pointSize: 14
            font.family: "fontawesome"
            leftPadding: 70
            echoMode: TextField.PasswordEchoOnEdit
            background: Rectangle {
                implicitWidth: 200
                implicitHeight: 50
                radius: implicitHeight / 2
                color: "transparent"
                Text {
                    text: "IDCard"
                    font.pointSize: 14
                    font.family: "fontawesome"
                    color: mainAppColor
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    leftPadding: 10

                }

                Rectangle {
                    width: parent.width - 10
                    height: 1
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    color: mainAppColor
                }
            }
        }
        Button{
            onClicked: {
                deleteUser(card.text)
                myUserModel.updateModel();
            }
        }
    }
}
