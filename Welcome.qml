import QtQuick 2.0

Rectangle {

    id: iWelcome

    Keys.onPressed: if(event.key === Qt.Key_Escape) {
                        console.log("Recieved escape in welcome");
                        iRoot.state = "GUIDE";
                    }

    Behavior on opacity {
        NumberAnimation { duration: 200 }
    }



    TitleBar {
        id: iWelcomeTitle
        width: parent.width
        height: parent.height
        color: "#333333"

        title: "Welcome to  tv"
    }

    TextWithFont {
        id: iWifi
        text: "<b>Connect to WiFi</b> > Sign in to iCloud > Set Up Services"
        font.pixelSize: 21
        anchors.top: parent.top
        anchors.topMargin: 0.13*parent.height
        anchors.left: iWelcomeTitle.left
        anchors.leftMargin: 0.05*parent.width
        color: "white"
    }

    Rectangle {
        height: 1
        width: 0.9 * parent.width
        anchors.top: iWifi.bottom
        anchors.topMargin: 16
        anchors.left: parent.left
        anchors.leftMargin: 0.05*parent.width
    }

    TextWithFont {
        id: iNetworks
        text: "Networks"
        font.pixelSize: 24
        font.underline: true
        anchors.top: parent.top
        anchors.topMargin: 0.23*parent.height
        anchors.left: iWelcomeTitle.left
        anchors.leftMargin: 0.05*parent.width
        color: "white"
    }

    SelectorList {
        anchors.top: parent.top
        anchors.left: iWelcomeTitle.left
        anchors.topMargin: 0.29*parent.height
        anchors.leftMargin: 0.05*parent.width
        focus: iWelcome.focus
        onFocusChanged: console.log("Focus is" + focus)
    }

    Rectangle {
        Image {
            source: "./images/wifi.png"
            x: 210
            y: 218
            width: 20
            height: 20
            fillMode: Image.PreserveAspectFit
        }
    }
    Rectangle {
        Image {
            source: "./images/wifi.png"
            x: 210
            y: 266
            width: 20
            height: 20
            fillMode: Image.PreserveAspectFit
        }
    }
    Rectangle {
        Image {
            source: "./images/wifi.png"
            x: 210
            y: 314
            width: 20
            height: 20
            fillMode: Image.PreserveAspectFit
        }
    }



}
