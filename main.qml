import QtQuick 2.3
import QtQuick.Window 2.2

Window {
    id: iWindow
    visible: true
    width: 1280
    height: 720
    color: "#333333"

    property string newMediaType: ""
    property string oldState: ""

    // Key pressing stuff
    Item {
        id: iRoot
        anchors.fill: parent
        focus: true
        state: "GUIDE"
        Keys.onPressed: {
            var newState = "GUIDE";

            if(event.key === Qt.Key_Left) {
                newState = "BROWSE";
                newMediaType = "Music";
            }else if(event.key === Qt.Key_Right)
                console.log("User clicked on TV");
            else if(event.key === Qt.Key_Up)
                console.log("User clicked on Apps");
            else if(event.key === Qt.Key_Down)
                console.log("User clicked on Movies");
            else if(event.key === Qt.Key_Escape)
                newState = "GUIDE";
            else if(event.key === Qt.Key_Return)
                newState = "SEARCH";
            else if(event.key === Qt.Key_W)
                newState = "WELCOME";

            oldState = state;
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
                PropertyChanges {
                    target: iScreenWelcome; opacity: 0.0
                }
                PropertyChanges {
                    target: iRoot; focus: true
                }
            },
            State {
                name: "WELCOME"
                PropertyChanges {
                    target: iScreenGuide; opacity: 0.0
                }
                PropertyChanges {
                    target: iScreenBrowse; opacity: 0.0
                }
                PropertyChanges {
                    target: iScreenWelcome; opacity: 1.0; focus: true
                }
                PropertyChanges {
                    target: iRoot; focus: false
                }
            },
            State {
                name: "SEARCH"
                PropertyChanges {
                    target: iScreenGuide; opacity: 0.0
                }
                PropertyChanges {
                    target: iRoot; focus: false
                }
                PropertyChanges {
                    target: iScreenSearch; opacity: 1.0; focus: true
                }
                PropertyChanges {
                    target: iScreenWelcome; opacity: 0.0
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
                PropertyChanges {
                    target: iScreenWelcome; opacity: 0.0
                }
            }
        ]
    }

    Search {
        id: iScreenSearch
        anchors.fill: parent
        anchors.centerIn: parent
        color: "#333333"
        opacity: 0.0
    }

    Guide {
        id: iScreenGuide
        anchors.fill: parent
        anchors.centerIn: parent
        color: "#333333"
        visible: true
    }

    Welcome {
        id: iScreenWelcome
        anchors.fill: parent
        anchors.centerIn: parent
        color: "#333333"
        opacity: 0.0
        onFocusChanged: console.log("Welcome focus is " + focus)
    }

    Browse {
        id: iScreenBrowse
        anchors.fill: parent
        anchors.centerIn: parent
        color: "#333333"
        mediaType: newMediaType
        opacity: 0.0
    }

}
