import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.0

Window {
    id: rootWindow
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    property color backGroundColor : "#394454"
    property color mainAppColor: "#6fda9c"
    property color mainTextCOlor: "#f0f0f0"
    property color popupBackGroundColor: "#b44"
    property color popupTextCOlor: "#ffffff"

    FontLoader {
        id: fontAwesome
        name: "fontawesome"
        source: "qrc:/fontawesome-webfont.ttf"
    }

    // Main stackview
    StackView{
        id: stackView
        focus: true
        anchors.fill: parent
    }

    // After loading show initial Login Page
    Component.onCompleted: {
        stackView.push("qrc:/LogIn.qml")   //initial page
    }
    Popup {
        id: popup
        property alias popMessage: message.text

        background: Rectangle {
            implicitWidth: rootWindow.width
            implicitHeight: 60
            color: popupBackGroundColor
            anchors.centerIn: parent
        }
        y: rootWindow.height - 60
        modal: true
        focus: true
        closePolicy: Popup.CloseOnPressOutside
        Text {
            id: message
            anchors.centerIn: parent
            font.pointSize: 12
            color: popupTextCOlor
        }
        onOpened: popupClose.start()
    }

    // Popup will be closed automatically in 2 seconds after its opened
    Timer {
        id: popupClose
        interval: 2000
        onTriggered: popup.close()
    }
    // Login users
    function loginUser(uname, pword)
    {
        var message = ""
        if(uname.trim()==="" || pword.trim()==="")
        {
            message = "Username or password must be filled"
            popup.popMessage = message
            popup.open()
        }
        else if(connectDB.doLogin(uname,pword))
        {
            showUserInfo()
        }
        else
        {
            message = "Wrong!"
            popup.popMessage = message
            popup.open()
        }
    }
    // Show UserInfo page
    function showUserInfo()
    {
        stackView.replace("qrc:/QuanLy.qml")
    }

    // Logout and show login page
    function logoutSession()
    {
        stackView.replace("qrc:/LogIn.qml")
    }
    function addUser(IDCard, NewHoTen, NewGioiTinh, NewMSV, NewTruong, NewQuyen, NewKhoa, NewPhone, NewEmail, NewAdress, NewDatebirth){
        var message = ""
        if(connectDB.doAdd(IDCard, NewHoTen, NewGioiTinh, NewMSV, NewTruong, NewQuyen, NewKhoa, NewPhone, NewEmail, NewAdress, NewDatebirth)){
            message = "Add Success!"
            popup.popMessage = message
            popup.open()
        }
        else
        {
            message = "Add failed!"
            popup.popMessage = message
            popup.open()
        }
    }
    function updateUser(IDCard, NewHoTen, NewGioiTinh, NewMSV, NewTruong, NewQuyen, NewKhoa, NewPhone, NewEmail, NewAdress, NewDatebirth){
        var message = ""
        if(connectDB.doChange(IDCard, NewHoTen, NewGioiTinh, NewMSV, NewTruong, NewQuyen, NewKhoa, NewPhone, NewEmail, NewAdress, NewDatebirth)){
            message = "Update Success!"
            popup.popMessage = message
            popup.open()
        }
        else
        {
            message = "Update failed!"
            popup.popMessage = message
            popup.open()
        }
    }
    function deleteUser(IDCard){
        var message = ""
        if(connectDB.doDelete(IDCard)){
            message = "Delete Success!"
            popup.popMessage = message
            popup.open()
        }
        else
        {
            message = "Delete failed!"
            popup.popMessage = message
            popup.open()
        }
    }
}
