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
                newState = "BROWSE_MUSIC";
                newMediaType = "Music";
            } else if(event.key === Qt.Key_Right){
                newState = "BROWSE_TV";
                newMediaType = "TV";
            } else if(event.key === Qt.Key_Up){
                newState = "BROWSE_APPS";
                newMediaType = "Apps";
            } else if(event.key === Qt.Key_Down){
                newState = "BROWSE_MOVIES";
                newMediaType = "Movies";
            } else if(event.key === Qt.Key_Escape)
                newState = "GUIDE";
            else if(event.key === Qt.Key_Return)
                newState = "SEARCH";
            else if(event.key === Qt.Key_W)
                newState = "WELCOME";
            else if(event.key === Qt.Key_D)
                newState = "DETAIL";

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
                    target: iScreenMovies; opacity: 0.0
                }
                PropertyChanges {
                    target: iScreenWelcome; opacity: 0.0
                }
                PropertyChanges {
                    target: iScreenDetail; opacity: 0.0
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
                    target: iScreenDetail; opacity: 0.0
                }
                PropertyChanges {
                    target: iRoot; focus: false
                }
            },
            State {
                name: "DETAIL"
                PropertyChanges {
                    target: iScreenGuide; opacity: 0.0
                }
                PropertyChanges {
                    target: iScreenBrowse; opacity: 0.0
                }
                PropertyChanges {
                    target: iScreenWelcome; opacity: 0.0
                }
                PropertyChanges {
                    target: iScreenDetail; opacity: 1.0; focus: true
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
                    target: iScreenDetail; opacity: 0.0
                }
                PropertyChanges {
                    target: iScreenWelcome; opacity: 0.0
                }
                PropertyChanges {
                    target: iScreenMovies; opacity: 0.0
                }
            },
            State {
                name: "BROWSE_MOVIES"
                PropertyChanges {
                    target: iScreenGuide; opacity: 0.0
                }
                PropertyChanges {
                    target: iRoot; focus: false
                }
                PropertyChanges {
                    target: iScreenMovies; opacity: 1.0; focus: true
                }
                PropertyChanges {
                    target: iScreenDetail; opacity: 0.0
                }
                PropertyChanges {
                    target: iScreenWelcome; opacity: 0.0
                }
            },
            State {
                name: "BROWSE_TV"
                PropertyChanges {
                    target: iScreenGuide; opacity: 0.0
                }
                PropertyChanges {
                    target: iScreenMovies; opacity: 1.0
                }
                PropertyChanges {
                    target: iScreenDetail; opacity: 0.0
                }
                PropertyChanges {
                    target: iScreenWelcome; opacity: 0.0
                }
            },
            State {
                name: "BROWSE_APPS"
                PropertyChanges {
                    target: iScreenGuide; opacity: 0.0
                }
                PropertyChanges {
                    target: iScreenMovies; opacity: 1.0
                }
                PropertyChanges {
                    target: iScreenDetail; opacity: 0.0
                }
                PropertyChanges {
                    target: iScreenWelcome; opacity: 0.0
                }
            },
            State {
                name: "BROWSE_MUSIC"
                PropertyChanges {
                    target: iScreenGuide; opacity: 0.0
                }
                PropertyChanges {
                    target: iScreenMovies; opacity: 1.0
                }
                PropertyChanges {
                    target: iScreenDetail; opacity: 0.0
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
    }

    Detail {
        id: iScreenDetail
        anchors.fill: parent
        anchors.centerIn: parent
        color: "#333333"
        opacity: 0.0
    }

    Browse {
        id: iScreenMovies
        anchors.fill: parent
        anchors.centerIn: parent
        color: "#333333"
        mediaType: newMediaType
        opacity: 0.0
        recentsElements: [{name: "The Lego Movie", posterURL: "images/LegoMovie.jpg"},{name: "The Lion King", posterURL: "images/LionKing.jpg"},{name: "Star Trek Into Darkness", posterURL: "images/StarTrek.jpg"},{name: "The Avengers", posterURL: "images/Avengers.jpg"},{name: "V For Vendetta", posterURL: "images/VForVendetta.jpg"},{name: "Les Miserables", posterURL: "images/LesMis.jpg"},{name: "Wreck-It Ralph", posterURL: "images/Ralph.jpg"},{name: "We're The Millers", posterURL: "images/Millers.jpg"},]
        topRatedElements: [{name: "Inception", posterURL: "images/Inception.jpg"},{name: "Titanic", posterURL: "images/Titanic.jpg"}, {name: "Tangled", posterURL: "images/Tangled.jpg"},{name: "The Dark Knight", posterURL: "images/DarkKnight.jpg"},{name: "Frozen", posterURL: "images/Frozen.jpg"}, {name: "Black Swan", posterURL: "images/BlackSwan.jpg"}, {name: "Anchorman", posterURL: "images/Anchorman.jpg"}, {name: "Aladdin", posterURL: "images/Aladdin.jpg"}]
        newReleasesElements: [{name: "Interstellar", posterURL: "images/Interstellar.jpg"},{name: "Neighbors", posterURL: "images/Neighbors.jpg"},{name: "Godzilla", posterURL: "images/Godzilla.jpg"},{name: "The Hunger Games", posterURL: "images/HungerGames.jpg"},{name: "We're The Millers", posterURL: "images/Millers.jpg"},]
    }

}
