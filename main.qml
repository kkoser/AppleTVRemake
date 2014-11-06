import QtQuick 2.3
import QtQuick.Window 2.2

Window {
    visible: true
    width: 1280
    height: 720
    color: "#333333"

    // Key pressing stuff
    Item {
        id: iRoot
        anchors.fill: parent
        focus: true
        state: "HOME"
        Keys.onPressed: {
            if(event.key === Qt.Key_Left)
                console.log("User clicked on Music");
            else if(event.key === Qt.Key_Right)
                console.log("User click on TV");
            else if(event.key === Qt.Key_Up)
                console.log("User clicked on Apps");
            else if(event.key === Qt.Key_Down)
                console.log("User clicked on Movies");
            else if(event.key === Qt.Key_Return)
                console.log("User clicked on universal search");

            state = state === "HOME" ? "SEARCH" : "HOME";
        }

        states: [
            State {
                name: "HOME"
                PropertyChanges {
                    target: iScreenHome; opacity: 1.0;
                }
            },
            State {
                name: "SEARCH"
                PropertyChanges {
                    target: iScreenHome; opacity: 0.0
                }
            }


        ]
    }

    Guide {
        id: iScreenHome
        anchors.fill: parent
        anchors.centerIn: parent
        color: "#333333"
        visible: false
    }

    Keyboard {
        //anchors.centerIn: parent
    }
}
