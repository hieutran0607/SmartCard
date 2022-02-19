import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import QtQuick.Timeline 1.0
Page {
    id: loginPage

    signal registerClicked()
    state: "State1"

    background: Rectangle {
        color: backGroundColor
    }

    Rectangle {
        id: iconRect
        width: parent.width
        height: parent.height / 3
        color: backGroundColor

        Text {
            id: icontext
            text: qsTr("\uf169")
            anchors.centerIn: parent
            font.pointSize: 112
            font.family: "fontawesome"
            color: mainAppColor
        }
    }

    ColumnLayout {
        id: columnSum
        width: parent.width
        anchors.top: iconRect.bottom
        spacing: 15

        TextField {
            id: loginUsername
            placeholderText: qsTr("User name")
            Layout.preferredWidth: parent.width - 20
            Layout.alignment: Qt.AlignHCenter
            color: mainTextCOlor
            font.pointSize: 14
            font.family: "fontawesome"
            leftPadding: 30
            background: Rectangle {
                implicitWidth: 200
                implicitHeight: 50
                radius: implicitHeight / 2
                color: "transparent"

                Text {
                    text: "\uf007"
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

        TextField {
            id: loginPassword
            placeholderText: qsTr("Password")
            Layout.preferredWidth: parent.width - 20
            Layout.alignment: Qt.AlignHCenter
            color: mainTextCOlor
            font.pointSize: 14
            font.family: "fontawesome"
            leftPadding: 30
            echoMode: TextField.PasswordEchoOnEdit
            background: Rectangle {
                implicitWidth: 200
                implicitHeight: 50
                radius: implicitHeight / 2
                color: "transparent"
                Text {
                    text: "\uf023"
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

        Item {
            height: 20
        }

        CButton{
            height: 50
            Layout.preferredWidth: loginPage.width - 20
            Layout.alignment: Qt.AlignHCenter
            name: "Log In"
            baseColor: mainAppColor
            borderColor: mainAppColor
            onClicked: {
                loginUser(loginUsername.text, loginPassword.text)
            }
        }
    }

    Timeline {
        id: open
        animations: [
            TimelineAnimation {
                id: openAnimation
                duration: 1000
                running: false
                loops: 1
                to: 1000
                from: 0
            }
        ]
        startFrame: 0
        endFrame: 1000
        enabled: false

        KeyframeGroup {
            target: columnSum
            property: "opacity"

            Keyframe {
                frame: 0
                value: 0
            }

            Keyframe {
                frame: 1001
                value: 1
            }
        }

        KeyframeGroup {
            target: columnSum
            property: "anchors.topMargin"

            Keyframe {
                frame: 0
                value: -40
            }

            Keyframe {
                easing.bezierCurve: [0.216,0.35,0.666,1,1,1]
                frame: 1000
                value: 0
            }
        }
    }
    states: [
        State {
            name: "State1"

            PropertyChanges {
                target: loginUsername
                opacity: 1
            }

            PropertyChanges {
                target: open
                enabled: true
            }

            PropertyChanges {
                target: openAnimation
                running: true
            }

            PropertyChanges {
                target: columnSum
                opacity: 0
                anchors.topMargin: -40
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.9;height:480;width:640}D{i:4}D{i:15}
}
##^##*/
