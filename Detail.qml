import QtQuick 2.0

Rectangle {

    id: iDetail

    Keys.onPressed: if(event.key === Qt.Key_Escape) iRoot.state = "GUIDE";

    Behavior on opacity {
        NumberAnimation { duration: 200 }
    }

    TitleBar {
        id: iDetailTitle
        width: parent.width
        height: parent.height
        color: "#333333"

        title: "The Lego Movie"
    }








}
