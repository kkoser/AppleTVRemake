import QtQuick 2.0

Rectangle {
    property alias title: iTitle.text

    TextWithFont {
        id: iTitle
        anchors.top: parent.top
        anchors.left: parent.left
        font.pixelSize: 26
        color: "white"
        anchors.leftMargin: 0.05*parent.width
        anchors.topMargin: 0.05*parent.height

    }


    Rectangle {
        height: 2
        width: 0.9 * parent.width
        anchors.top: iTitle.bottom
        anchors.topMargin: 8
        anchors.left: parent.left
        anchors.leftMargin: 0.05*parent.width
    }
}
