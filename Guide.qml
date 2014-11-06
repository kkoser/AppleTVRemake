import QtQuick 2.3
import QtQuick.Controls 1.2

Rectangle {
    id: iGuide

    Behavior on opacity {
        NumberAnimation { duration: 200 }
    }

    Rectangle {
        id: iLargeCircle

        anchors.centerIn: parent
        width: 300
        height: 300
        radius: width/2
        color: "lightgrey"
        border.width: .5
        border.color: "grey"

        Rectangle {
            anchors.centerIn: parent
            width: parent.width/2
            height: parent.height/2
            radius: width/2
            color: "white"
            border.width: .5
            border.color: "grey"

            MouseArea {
                anchors.fill: parent

                Text {
                    anchors.centerIn: parent
                    text: "Search"
                    font.pixelSize: 28
                }

                onClicked: console.log("User clicked on the universal search");
            }
        }

        Rectangle {
            anchors.top: parent.top
            anchors.topMargin: parent.height / 12
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width/20
            height: parent.height/20
            radius: width/2
            color: "black"
        }
        Rectangle {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height / 12
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width/20
            height: parent.height/20
            radius: width/2
            color: "black"
        }
        Rectangle {
            anchors.left: parent.left
            anchors.leftMargin: parent.height / 12
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width/20
            height: parent.height/20
            radius: width/2
            color: "black"
        }
        Rectangle {
            anchors.right: parent.right
            anchors.rightMargin: parent.height / 12
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width/20
            height: parent.height/20
            radius: width/2
            color: "black"
        }
    }

    Text {
        text: "Apps"
        color: "white"
        font.pixelSize: 25
        anchors.bottom: iLargeCircle.top
        anchors.bottomMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Text {
        text: "Movies"
        color: "white"
        font.pixelSize: 25
        anchors.top: iLargeCircle.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Text {
        text: "TV"
        color: "white"
        font.pixelSize: 25
        anchors.left: iLargeCircle.right
        anchors.leftMargin: 20
        anchors.verticalCenter: parent.verticalCenter
    }
    Text {
        text: "Music"
        color: "white"
        font.pixelSize: 25
        anchors.right: iLargeCircle.left
        anchors.rightMargin: 20
        anchors.verticalCenter: parent.verticalCenter
    }

    Text {
        text: "Press Guide to dismiss"
        color: "white"
        font.pixelSize: 15
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
    }
}
