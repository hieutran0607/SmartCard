import QtQuick 2.12
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
Item {
    width: swipeView.width
    height: swipeView.height

    TableView {
        id: tableView
        anchors.fill: parent
        clip: true
        TableViewColumn {
            role: "IDCard"
            title: "IDCard"
        }
        TableViewColumn {
            role: "Full Name"
            title: "Full Name"
        }
        TableViewColumn {
            role: "Gender"
            title: "Gender"
        }
        TableViewColumn {
            role: "Date Of Birth"
            title: "Date Of Birth"
        }
        TableViewColumn {
            role: "StudentCode"
            title: "StudentCode"
        }
        TableViewColumn {
            role: "University"
            title: "University"
        }
        TableViewColumn {
            role: "Department"
            title: "Department"
        }
        TableViewColumn {
            role: "PhoneNumber"
            title: "PhoneNumber"
        }
        TableViewColumn {
            role: "Email"
            title: "Email"
        }
        TableViewColumn {
            role: "Address"
            title: "Address"
        }
        TableViewColumn {
            role: "Position"
            title: "Position"
        }
        model: myUserModel

        rowDelegate: Rectangle {
            anchors.fill: parent
            color: styleData.selected ? 'skyblue' : (styleData.alternate ? 'whitesmoke' : 'white');
            MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton | Qt.LeftButton
                onClicked: {
                    tableView.selection.clear()
                    tableView.selection.select(styleData.row)
                    tableView.currentRow = styleData.row
                    tableView.focus = true

                    switch(mouse.button) {
                    case Qt.RightButton:
                        contextMenu.popup() // Call the context menu
                        break
                    default:
                        break
                    }
                }
            }
        }
    }
}
