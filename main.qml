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
        searchItems: iScreenMovies.recentsElements.concat(iScreenMovies.topRatedElements).concat(iScreenMovies.newReleasesElements).concat(iScreenTV.recentsElements).concat(iScreenTV.topRatedElements).concat(iScreenTV.newReleasesElements).concat(iScreenMusic.recentsElements).concat(iScreenMusic.topRatedElements).concat(iScreenMusic.newReleasesElements)
        //searchItems: [{name: "Inception", posterURL: "images/Inception.jpg"},{name: "Titanic", posterURL: "images/Titanic.jpg"}, {name: "Tangled", posterURL: "images/Tangled.jpg"},{name: "The Dark Knight", posterURL: "images/DarkKnight.jpg"},{name: "Frozen", posterURL: "images/Frozen.jpg"}, {name: "Black Swan", posterURL: "images/BlackSwan.jpg"}, {name: "Anchorman", posterURL: "images/Anchorman.jpg"}, {name: "Aladdin", posterURL: "images/Aladdin.jpg"}]
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
        recentsElements: [{name: "Sherlock", posterURL: "images/Sherlock.jpg", mediaType: "TV"},{name: "30 Rock", posterURL: "images/30Rock.jpg"},{name: "Pokemon XY", posterURL: "images/Pokemon.jpg"},{name: "Top Gear", posterURL: "images/TopGear.jpg"},{name: "White Collar", posterURL: "images/WhiteCollar.jpg"},{name: "The Simpsons", posterURL: "images/TheSimpsons.jpg"},{name: "The Office", posterURL: "images/TheOffice.jpg"},{name: "Portlandia", posterURL: "images/Portlandia.jpg"}]
        topRatedElements: [{name: "Once Upon A Time", posterURL: "images/OnceUponATime.jpg", mediaType: "TV"},{name: "The Legend of Korra", posterURL: "images/Korra.jpg", mediaType: "TV"}, {name: "Game of Thrones", posterURL: "images/GameOfThrones.jpg", mediaType: "TV"},{name: "Burn Notice", posterURL: "images/BurnNotice.jpg", mediaType: "TV"},{name: "Arrow", posterURL: "images/Arrow.jpg", mediaType: "TV"}, {name: "Arrested Development", posterURL: "images/ArrestedDevelopment.jpg", mediaType: "TV"}, {name: "The X Files", posterURL: "images/XFiles.jpg", mediaType: "TV"}, {name: "Mad Men", posterURL: "images/MadMen.jpg", mediaType: "TV"}]
        newReleasesElements: [{name: "Breaking Bad", posterURL: "images/BreakingBad.jpg", mediaType: "TV"},{name: "House of Cards", posterURL: "images/HouseOfCards.jpg", mediaType: "TV"},{name: "The West Wing", posterURL: "images/WestWing.jpg", mediaType: "TV"},{name: "Lost", posterURL: "images/Lost.jpg", mediaType: "TV"},{name: "Firefly", posterURL: "images/Firefly.jpg", mediaType: "TV"},{name: "Heroes", posterURL: "images/Heroes.jpg", mediaType: "TV"},{name: "Merlin", posterURL: "images/Merlin.jpg", mediaType: "TV"},{name: "Fringe", posterURL: "images/Fringe.jpg", mediaType: "TV"}]
    }

    Browse {
        id: iScreenMusic
        anchors.fill: parent
        anchors.centerIn: parent
        color: "#333333"
        mediaType: newMediaType
        opacity: 0.0
        recentsElements: [{name: "1989", posterURL: "images/1989.jpg", mediaType: "Music"},{name: "X & Y", posterURL: "images/XY.jpg", mediaType: "Music"},{name: "Port of Morrow", posterURL: "images/PortOfMorrow.jpg", mediaType: "Music"},{name: "AM", posterURL: "images/AM.jpg", mediaType: "Music"},{name: "Whispers", posterURL: "images/Whispers.jpg", mediaType: "Music"},{name: "Midnight Memories", posterURL: "images/MidnightMemories.jpg", mediaType: "Music"},{name: "Of Monsters and Men", posterURL: "images/OfMonstersAndMen.jpg", mediaType: "Music"},{name: "Pure Heroine", posterURL: "images/PureHeroine.jpg", mediaType: "Music"}]
        topRatedElements: [{name: "Born To Die", posterURL: "images/BornToDie.jpg", mediaType: "Music"},{name: "Night Visions", posterURL: "images/NightVisions.jpg", mediaType: "Music"}, {name: "Recovery", posterURL: "images/Recovery.jpg", mediaType: "Music"},{name: "X", posterURL: "images/X.jpg", mediaType: "Music"},{name: "Drake", posterURL: "images/Drake.jpg", mediaType: "Music"}, {name: "Dark Side of the Moon", posterURL: "images/Darkside.jpg", mediaType: "Music"}, {name: "Ghost Stories", posterURL: "images/GhostStories.jpg", mediaType: "Music"}, {name: "Beyonce", posterURL: "images/Beyonce.jpg", mediaType: "Music"}]
        newReleasesElements: [{name: "My Everything", posterURL: "images/MyEverything.jpg", mediaType: "Music"},{name: "Awesome Wave", posterURL: "images/AwesomeWave.jpg", mediaType: "Music"},{name: "Conditions", posterURL: "images/Conditions.jpg", mediaType: "Music"},{name: "The Bones of What You Believe", posterURL: "images/TheBonesOfWhatYouBelieve.jpg", mediaType: "Music"},{name: "blink-182", posterURL: "images/Blink182.jpg", mediaType: "Music"},{name: "Modern Vampires Of The City", posterURL: "images/ModernVampiresOfTheCity.jpg", mediaType: "Music"},{name: "Elephant Shell", posterURL: "images/ElephantShell.jpg", mediaType: "Music"},{name: "Drops Of Jupiter", posterURL: "images/DropsOfJupiter.jpg", mediaType: "Music"}]
    }
}
