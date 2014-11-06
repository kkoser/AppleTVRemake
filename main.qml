import QtQuick 2.3
import QtQuick.Window 2.2

Window {
    visible: true
    width: 1280
    height: 720
    color: "#333333"

    property string newMediaType: ""

    // Key pressing stuff
    Item {
        id: iRoot
        anchors.fill: parent
        focus: true
        state: "GUIDE"
        Keys.onPressed: {
            var newState = "GUIDE";

            if(event.key === Qt.Key_Left) {
                console.log("User clicked on Music");
                newState = "BROWSE";
                newMediaType = "Music";
            } else if(event.key === Qt.Key_Right)
                console.log("User click on TV");
            else if(event.key === Qt.Key_Up)
                console.log("User clicked on Apps");
            else if(event.key === Qt.Key_Down)
                console.log("User clicked on Movies");
            else if(event.key === Qt.Key_Escape)
                newState = "GUIDE";
            else if(event.key === Qt.Key_Return) {
                newState = "BROWSE";
                newMediaType = "Music";
            }

            state = newState;

        }

        states: [
            State {
                name: "GUIDE"
                PropertyChanges {
                    target: iScreenGuide; opacity: 1.0
                }
                PropertyChanges {
                    target: iScreenBrowse; opacity: 0.0
                }
            },
            State {
                name: "SEARCH"
                PropertyChanges {
                    target: iScreenGuide; opacity: 0.0
                }
            },
            State {
                name: "BROWSE"
                PropertyChanges {
                    target: iScreenGuide; opacity: 0.0
                }
                PropertyChanges {
                    target: iScreenBrowse; opacity: 1.0
                }
            }


        ]
    }

    Guide {
        id: iScreenGuide
        anchors.fill: parent
        anchors.centerIn: parent
        color: "#333333"
        visible: false
    }

    Browse {
        id: iScreenBrowse
        anchors.fill: parent
        anchors.centerIn: parent
        color: "#333333"
        mediaType: newMediaType

    }
    Welcome {
        id: iWelcomeScreen
        anchors.fill: parent
        anchors.centerIn: parent
        visible: true
    }

//    Keyboard {
//        //anchors.centerIn: parent
//    }
}
