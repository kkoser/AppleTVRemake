import QtQuick 2.0

// @note This class is tightly coupled to the iRoot item in main.qml, as this is needed
// to handle going back to the main screen.
Rectangle {
    id: iSearch

    property int selectedResult: -1
    property variant searchResults: searchItems
    property variant searchItems
    property bool typing: true

    onFocusChanged: console.log("Search focus changed to " + focus);

    onTypingChanged: {
        if(typing)
            iResultsListView.currentIndex = -1;
        else
            iResultsListView.currentIndex = 0;
    }

    // This property is needed because the escape key will be caught and handled
    // By both the detail screen and this screen. So this property
    // is used to catch that and prevent it form going all the way
    // back to the guide menu
    property bool stateReady: true

    Keys.onPressed: {
        console.log("Recieved key" + event.key)
        if(event.key === Qt.Key_Escape && iSearch.stateReady)
            iRoot.state = "GUIDE";
        else if(event.key === Qt.Key_Escape)
            iSearch.stateReady = true;
        else if(event.key === Qt.Key_Return && iResultsListView.currentIndex >= 0)
            state = "DETAIL"

        if( iResultsListView.currentIndex >= 0) {
            switch(event.key) {
            case Qt.Key_Up:
                iResultsListView.currentIndex = iResultsListView.currentIndex > 0 ? iResultsListView.currentIndex -1 : 0
                break;
            case Qt.Key_Down:
                iResultsListView.currentIndex = iResultsListView.currentIndex < searchResults.length-1 ? iResultsListView.currentIndex + 1  : searchResults.length - 1
                break;
            case Qt.Key_Left:
                iResultsListView.currentIndex = -1;
                iKeyboard.showSelector = true;
                typing = true;
            }

        }
    }

    states: [
        State {
            name: "SEARCH"
            PropertyChanges {
                target: iScreenDetail; opacity: 0.0; focus: false
            }
            PropertyChanges {
                target: iSearch; opacity: 1.0; focus: true; stateReady: false
            }
        },
        State {
            name: "DETAIL"
            PropertyChanges {
                target: iScreenDetail; opacity: 1.0; focus: true
            }
            PropertyChanges {
                target: iSearch; opacity: 1.0; focus: false; stateReady: false
            }
        }
    ]

    TitleBar {
        id: iTitleBar
        width: parent.width
        height: parent.height / 10
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: parent.height / 20
        color: "#333333"

        title: "Search"
    }

    // Search Section

    TextWithFont {
        id: iTextSearch
        text: ""
        anchors.top: iResultsTitle.top
        anchors.topMargin: 17
        anchors.left: parent.left
        anchors.leftMargin: parent.width/20
        width: iKeyboard.width
        font.pixelSize: 21
    }
    Rectangle {
        height: 1
        anchors.left: iTextSearch.left
        anchors.right: iTextSearch.right
        anchors.top: iTextSearch.bottom
        color: "white"
    }

    Keyboard {
        id: iKeyboard
        keybaordEnabled: iSearch.focus
        allowsScrollingOff: true
        showSelectButton: true // @todo: MAKE THIS FALSE, FIX SUBMIT BUTTON NAME
        anchors.left: parent.left
        anchors.top: iTextSearch.bottom
        anchors.leftMargin: parent.width / 20
        anchors.topMargin: parent.height / 25

        onLetterClicked: {
            if(!iSearch.typing)
                return;
            iTextSearch.text += letter
            iSearch.searchResults = iSearch.searchItems.filter(function(obj) {
                return obj["name"].toUpperCase().indexOf(iTextSearch.text) === 0;
            });
        }
        onDeleteClicked: {
            iTextSearch.text = iTextSearch.text.substring(0, iTextSearch.text.length - 1);
            iSearch.searchResults = iSearch.searchItems.filter(function(obj) {
                return obj["name"].toUpperCase().indexOf(iTextSearch.text) === 0;
            });
        }
        onCursorMovedOffRight: {
            console.log("Need to move over to search result");
            iKeyboard.showSelector = false;
            //selectedResult = 0;
            iResultsListView.currentIndex = 0;
            iSearch.focus = true;
            iSearch.typing = false;
        }

        onKeybaordEnabledChanged: console.log("Keyboard entered state: " + keybaordEnabled);
    }


    // Results section

    TitleBar {
        id: iResultsTitle
        width: parent.width / 2
        anchors.right: iTitleBar.right
        anchors.rightMargin: width / 20
        height: parent.height / 10
        anchors.top: iTitleBar.bottom
        //anchors.topMargin: height / 10
        color: "#333333"

        title: "Results for \"" + iTextSearch.text + "\""
    }

//    Flickable {
//        width: iResultsTitle.width
//        anchors.right: iTitleBar.right
//        anchors.top: iResultsTitle.bottom
//        anchors.bottom: parent.bottom
//        contentWidth: iResultsColumn.width
//        contentHeight: iResultsColumn.height
//        clip: true

//        Column {
//            id: iResultsColumn

//            spacing: 2

//            Repeater {
//                model: searchResults.length
//                SearchResult{
//                    title: searchResults[index]["name"]
//                    service: "Netflix"
//                    imageURL: searchResults[index]["posterURL"]
//                    width: iResultsTitle.width*.9
//                    height: 200
//                    color: "#333333"
//                    selected: selectedResult === index
//                }
//            }
//        }
//    }

    ListView {
        id: iResultsListView
        width: iResultsTitle.width
        anchors.right: iTitleBar.right
        anchors.top: iResultsTitle.bottom
        anchors.bottom: parent.bottom
        clip: true
        currentIndex: -1

        // Needed to prevent immediately entering the detail
        // when the list is filtered
        onModelChanged: currentIndex = -1;

        model: searchResults.length

        delegate: SearchResult {
            title: searchResults[index]["name"]
            service: "Netflix"
            imageURL: searchResults[index]["posterURL"]
            width: iResultsTitle.width*.9
            height: 200
            color: "#333333"
            selected: iResultsListView.currentIndex === index
        }
    }

    Detail {
        id: iScreenDetail
        anchors.fill: parent
        opacity: 0.0
        onBack: iSearch.state = "SEARCH"
        itemInfo: searchResults[iResultsListView.currentIndex]
    }

}
