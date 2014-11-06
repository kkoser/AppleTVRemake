import QtQuick 2.0

Rectangle {

    color: "#333333"
    width: 500
    height: 500

    Text {
        text: "Welcome to TV"
        color: "white"
        font.pixelSize: parent.width/25
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: parent.height/12
        anchors.leftMargin: parent.width/12
    }



}
