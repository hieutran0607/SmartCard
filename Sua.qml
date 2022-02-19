import QtQuick 2.7
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
Page {
    id: suaPage
    background: Rectangle {
        color: backGroundColor
    }

    ColumnLayout{
        anchors.fill: parent
        anchors.bottomMargin: 133
        ColumnLayout{
            spacing: 15
            width: suaPage.width
            Row{
                id: nameRow
                spacing: 15

                TextField {
                    id: fullName
                    placeholderText: qsTr("User name")
                    Layout.preferredWidth: parent.width - 20
                    Layout.alignment: Qt.AlignHCenter
                    color: mainTextCOlor
                    font.pointSize: 14
                    font.family: "fontawesome"
                    leftPadding: 95 // cách để phù hợp với text(như một label) phía dưới
                    background: Rectangle {
                        implicitWidth: 200
                        implicitHeight: 50
                        radius: implicitHeight / 2
                        color: "transparent"

                        Text {
                            text: "Họ tên"
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
                    id: mSV
                    placeholderText: qsTr("msv")
                    Layout.preferredWidth: parent.width - 20
                    Layout.alignment: Qt.AlignHCenter
                    color: mainTextCOlor
                    font.pointSize: 14
                    font.family: "fontawesome"
                    leftPadding: 95
                    background: Rectangle {
                        implicitWidth: 200
                        implicitHeight: 50
                        radius: implicitHeight / 2
                        color: "transparent"
                        Text {
                            text: "MSV"
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
                    id: department
                    placeholderText: qsTr("Department")
                    Layout.preferredWidth: parent.width - 20
                    Layout.alignment: Qt.AlignHCenter
                    color: mainTextCOlor
                    font.pointSize: 14
                    font.family: "fontawesome"
                    leftPadding: 95 // cách để phù hợp với text(như một label) phía dưới
                    background: Rectangle {
                        implicitWidth: 200
                        implicitHeight: 50
                        radius: implicitHeight / 2
                        color: "transparent"

                        Text {
                            text: "Khoa"
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
            }
            Row{
                id: genRow
                spacing: 15

                TextField {
                    id: gender
                    placeholderText: qsTr("Gender")
                    Layout.preferredWidth: parent.width - 20
                    Layout.alignment: Qt.AlignHCenter
                    color: mainTextCOlor
                    font.pointSize: 14
                    font.family: "fontawesome"
                    leftPadding: 95 // cách để phù hợp với text(như một label) phía dưới
                    background: Rectangle {
                        implicitWidth: 200
                        implicitHeight: 50
                        radius: implicitHeight / 2
                        color: "transparent"

                        Text {
                            width: 80
                            height: 23
                            text: "Giới tính"
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
                    id: university
                    placeholderText: qsTr("University")
                    Layout.preferredWidth: parent.width - 20
                    Layout.alignment: Qt.AlignHCenter
                    color: mainTextCOlor
                    font.pointSize: 14
                    font.family: "fontawesome"
                    leftPadding: 95
                    background: Rectangle {
                        implicitWidth: 200
                        implicitHeight: 50
                        radius: implicitHeight / 2
                        color: "transparent"
                        Text {
                            text: "Trường"
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
                    id: phone
                    placeholderText: qsTr("Phone")
                    Layout.preferredWidth: parent.width - 20
                    Layout.alignment: Qt.AlignHCenter
                    color: mainTextCOlor
                    font.pointSize: 14
                    font.family: "fontawesome"
                    leftPadding: 95
                    background: Rectangle {
                        implicitWidth: 200
                        implicitHeight: 50
                        radius: implicitHeight / 2
                        color: "transparent"
                        Text {
                            text: "Điện thoại"
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
            }
            Row{
                id:posRow
                spacing: 15

                TextField {
                    id: position
                    placeholderText: qsTr("Position")
                    Layout.preferredWidth: parent.width - 20
                    Layout.alignment: Qt.AlignHCenter
                    color: mainTextCOlor
                    font.pointSize: 14
                    font.family: "fontawesome"
                    leftPadding: 95 // cách để phù hợp với text(như một label) phía dưới
                    background: Rectangle {
                        implicitWidth: 200
                        implicitHeight: 50
                        radius: implicitHeight / 2
                        color: "transparent"

                        Text {
                            text: "Quyền"
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
                    id: card
                    placeholderText: qsTr("IDCard")
                    Layout.preferredWidth: parent.width - 20
                    Layout.alignment: Qt.AlignHCenter
                    color: mainTextCOlor
                    font.pointSize: 14
                    font.family: "fontawesome"
                    leftPadding: 95
                    background: Rectangle {
                        implicitWidth: 200
                        implicitHeight: 50
                        radius: implicitHeight / 2
                        color: "transparent"
                        Text {
                            text: "Mã thẻ"
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
                    id: eMail
                    placeholderText: qsTr("Email")
                    Layout.preferredWidth: parent.width - 20
                    Layout.alignment: Qt.AlignHCenter
                    color: mainTextCOlor
                    font.pointSize: 14
                    font.family: "fontawesome"
                    leftPadding: 95 // cách để phù hợp với text(như một label) phía dưới
                    background: Rectangle {
                        implicitWidth: 200
                        implicitHeight: 50
                        radius: implicitHeight / 2
                        color: "transparent"

                        Text {
                            text: "Email"
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

            }
            Row{
                id:addRow
                spacing: 15
                TextField {
                    id: address
                    color: mainTextCOlor
                    font.pointSize: 14
                    placeholderText: qsTr("Address")
                    Layout.preferredWidth: parent.width - 20
                    leftPadding: 95
                    Layout.alignment: Qt.AlignHCenter
                    font.family: "fontawesome"
                    background: Rectangle {
                        color: "transparent"
                        radius: implicitHeight / 2
                        implicitWidth: 200
                        implicitHeight: 50
                        Text {
                            color: mainAppColor
                            text: "Địa chỉ"
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            font.pointSize: 14
                            font.family: "fontawesome"
                            leftPadding: 10
                        }

                        Rectangle {
                            width: parent.width - 10
                            height: 1
                            color: mainAppColor
                            anchors.bottom: parent.bottom
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                }
            }
        }
    }

    Button {
        x: 288
        y: 299
        onClicked: {
            updateUser(card.text, fullName.text, gender.text,fullName.text, mSV.text, university.text, department.text, phone.text,eMail.text,address.text,position.text)
            myUserModel.updateModel();
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.66;height:480;width:640}
}
##^##*/
