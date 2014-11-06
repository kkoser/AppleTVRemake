import QtQuick 2.0

Rectangle {
    property string mediaType: ""

    Behavior on opacity {
        NumberAnimation { duration: 200 }
    }

    TitleBar {
        id: iBrowseTitle
        title: "Browse for " + mediaType
        width: parent.width
        height: parent.height
        color: "#333333"
    }

    Text {
        text: "Recently " + (mediaType == "Music" ? "Listened" : "Watched")
        font.pixelSize: 21
        anchors.top: parent.top
        anchors.topMargin: 0.15*parent.height
        anchors.left: iBrowseTitle.left
        anchors.leftMargin: 0.05*parent.width
        color: "white"

    }

}
