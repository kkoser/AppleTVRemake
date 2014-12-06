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
        property string oldState
        function setState(newState) {
            console.log("Moving from state " + state + " to " + newState);
            oldState = state;
            state = newState;
        }

        function back() {
            console.log("Old state is" + oldState);
            state = oldState == "" ? "GUIDE" : oldState
            oldState = "";
        }

        Keys.onPressed: {
            if(event.key === Qt.Key_G) {
                back();
                return;
            }
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

            setState(newState);

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
                    target: iRoot; focus: false
                }
                PropertyChanges {
                    target: iScreenGuide; opacity: 0.0
                }
                PropertyChanges {
                    target: iScreenMovies; opacity: 0.0
                }
                PropertyChanges {
                    target: iScreenTV; opacity: 1.0; focus:true
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
                    target: iRoot; focus: false
                }
                PropertyChanges {
                    target: iScreenGuide; opacity: 0.0
                }
                PropertyChanges {
                    target: iScreenMovies; opacity: 0.0
                }
                PropertyChanges {
                    target: iScreenMusic; opacity: 1.0; focus: true
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
        searchItems: [{name: "Inception", posterURL: "images/Inception.jpg"},{name: "Titanic", posterURL: "images/Titanic.jpg"}, {name: "Tangled", posterURL: "images/Tangled.jpg"},{name: "The Dark Knight", posterURL: "images/DarkKnight.jpg"},{name: "Frozen", posterURL: "images/Frozen.jpg"}, {name: "Black Swan", posterURL: "images/BlackSwan.jpg"}, {name: "Anchorman", posterURL: "images/Anchorman.jpg"}, {name: "Aladdin", posterURL: "images/Aladdin.jpg"}]
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

    Browse {
        id: iScreenMovies
        anchors.fill: parent
        anchors.centerIn: parent
        color: "#333333"
        mediaType: newMediaType
        opacity: 0.0
        recentsElements: [{name: "The Lego Movie", posterURL: "images/LegoMovie.jpg", mediaType: "Movie"},{name: "The Lion King", posterURL: "images/LionKing.jpg", mediaType: "Movie"},{name: "Star Trek Into Darkness", posterURL: "images/StarTrek.jpg", mediaType: "Movie"},{name: "The Avengers", posterURL: "images/Avengers.jpg", mediaType: "Movie"},{name: "V For Vendetta", posterURL: "images/VForVendetta.jpg", mediaType: "Movie"},{name: "Les Miserables", posterURL: "images/LesMis.jpg", mediaType: "Movie"},{name: "Wreck-It Ralph", posterURL: "images/Ralph.jpg", mediaType: "Movie"},{name: "We're The Millers", posterURL: "images/Millers.jpg", mediaType: "Movie"}]
        topRatedElements: [{name: "Inception", posterURL: "images/Inception.jpg", mediaType: "Movie"},{name: "Titanic", posterURL: "images/Titanic.jpg", mediaType: "Movie"}, {name: "Tangled", posterURL: "images/Tangled.jpg", mediaType: "Movie"},{name: "The Dark Knight", posterURL: "images/DarkKnight.jpg", mediaType: "Movie"},{name: "Frozen", posterURL: "images/Frozen.jpg", mediaType: "Movie"}, {name: "Black Swan", posterURL: "images/BlackSwan.jpg", mediaType: "Movie"}, {name: "Anchorman", posterURL: "images/Anchorman.jpg", mediaType: "Movie"}, {name: "Aladdin", posterURL: "images/Aladdin.jpg", mediaType: "Movie"}]
        newReleasesElements: [{name: "Interstellar", posterURL: "images/Interstellar.jpg", mediaType: "Movie"},{name: "Neighbors", posterURL: "images/Neighbors.jpg", mediaType: "Movie"},{name: "Godzilla", posterURL: "images/Godzilla.jpg", mediaType: "Movie"},{name: "The Hunger Games", posterURL: "images/HungerGames.jpg", mediaType: "Movie"},{name: "We're The Millers", posterURL: "images/Millers.jpg", mediaType: "Movie"},{name: "The Grand Budapest Hotel", posterURL: "images/GrandBudapest.jpg", mediaType: "Movie"},{name: "Big Hero 6", posterURL: "images/BigHero6.jpg", mediaType: "Movie"},{name: "Gone Girl", posterURL: "images/GoneGirl.jpg", mediaType: "Movie"}]
    }

    Browse {
        id: iScreenTV
        anchors.fill: parent
        anchors.centerIn: parent
        color: "#333333"
        mediaType: newMediaType
        opacity: 0.0
        recentsElements: [{name: "Sherlock", posterURL: "images/Sherlock.jpg"},{name: "30 Rock", posterURL: "images/30Rock.jpg"},{name: "Pokemon XY", posterURL: "images/Pokemon.jpg"},{name: "Top Gear", posterURL: "images/TopGear.jpg"},{name: "White Collar", posterURL: "images/WhiteCollar.jpg"},{name: "The Simpsons", posterURL: "images/TheSimpsons.jpg"},{name: "The Office", posterURL: "images/TheOffice.jpg"},{name: "Portlandia", posterURL: "images/Portlandia.jpg"}]
        topRatedElements: [{name: "Once Upon A Time", posterURL: "images/OnceUponATime.jpg"},{name: "The Legend of Korra", posterURL: "images/Korra.jpg"}, {name: "Game of Thrones", posterURL: "images/GameOfThrones.jpg"},{name: "Burn Notice", posterURL: "images/BurnNotice.jpg"},{name: "Arrow", posterURL: "images/Arrow.jpg"}, {name: "Arrested Development", posterURL: "images/ArrestedDevelopment.jpg"}, {name: "The X Files", posterURL: "images/XFiles.jpg"}, {name: "Mad Men", posterURL: "images/MadMen.jpg"}]
        newReleasesElements: [{name: "Breaking Bad", posterURL: "images/BreakingBad.jpg"},{name: "House of Cards", posterURL: "images/HouseOfCards.jpg"},{name: "The West Wing", posterURL: "images/WestWing.jpg"},{name: "Lost", posterURL: "images/Lost.jpg"},{name: "Firefly", posterURL: "images/Firefly.jpg"},{name: "Heroes", posterURL: "images/Heroes.jpg"},{name: "Merlin", posterURL: "images/Merlin.jpg"},{name: "Fringe", posterURL: "images/Fringe.jpg"}]
    }

    Browse {
        id: iScreenMusic
        anchors.fill: parent
        anchors.centerIn: parent
        color: "#333333"
        mediaType: newMediaType
        opacity: 0.0
        recentsElements: [{name: "1989", posterURL: "images/1989.jpg"},{name: "X & Y", posterURL: "images/XY.jpg"},{name: "Port of Morrow", posterURL: "images/PortOfMorrow.jpg"},{name: "AM", posterURL: "images/AM.jpg"},{name: "Whispers", posterURL: "images/Whispers.jpg"},{name: "Midnight Memories", posterURL: "images/MidnightMemories.jpg"},{name: "Of Monsters and Men", posterURL: "images/OfMonstersAndMen.jpg"},{name: "Pure Heroine", posterURL: "images/PureHeroine.jpg"}]
        topRatedElements: [{name: "Born To Die", posterURL: "images/BornToDie.jpg"},{name: "Night Visions", posterURL: "images/NightVisions.jpg"}, {name: "Recovery", posterURL: "images/Recovery.jpg"},{name: "X", posterURL: "images/X.jpg"},{name: "Drake", posterURL: "images/Drake.jpg"}, {name: "Dark Side of the Moon", posterURL: "images/Darkside.jpg"}, {name: "Ghost Stories", posterURL: "images/GhostStories.jpg"}, {name: "Beyonce", posterURL: "images/Beyonce.jpg"}]
        newReleasesElements: [{name: "My Everything", posterURL: "images/MyEverything.jpg"},{name: "Awesome Wave", posterURL: "images/AwesomeWave.jpg"},{name: "Conditions", posterURL: "images/Conditions.jpg"},{name: "The Bones of What You Believe", posterURL: "images/TheBonesOfWhatYouBelieve.jpg"},{name: "blink-182", posterURL: "images/Blink182.jpg"},{name: "Modern Vampires Of The City", posterURL: "images/ModernVampiresOfTheCity.jpg"},{name: "Elephant Shell", posterURL: "images/ElephantShell.jpg"},{name: "Drops Of Jupiter", posterURL: "images/DropsOfJupiter.jpg"}]
    }
}
