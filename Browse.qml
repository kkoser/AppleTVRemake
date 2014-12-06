import QtQuick 2.0
import QtQuick.Controls 1.2

Rectangle {
    id: iBrowse
    property string mediaType: ""
    property variant recentsElements
    property variant topRatedElements
    property variant newReleasesElements

    property int overallSelectedIndex: 0
    property int recentsSelectedIndex: 0
    property int topRatedSelectedIndex: -1
    property int newReleasesSelectedIndex: -1
    property int selectedRow: 0; // 0 is recents, 1 is top rated, 2 is new releases

    // This property is needed because the escape key will be caught and handled
    // By both the detail screen and this screen. So this property
    // is used to catch that and prevent it form going all the way
    // back to the guide menu
    property bool stateReady: true

    Behavior on opacity {
        NumberAnimation { duration: 200 }
    }

    function moveLeft(index) {
        if(index === 0) {
            return recentsElements.length - 1;
        } else {
            return index - 1;
        }
    }

    function moveRight(index) {
        if(index === recentsElements.length - 1) {
            return 0;
        } else {
            return index + 1;
        }
    }

    Keys.onPressed: {
        switch(event.key) {
        case Qt.Key_Left:
            overallSelectedIndex = moveLeft(overallSelectedIndex);
            break;
        case Qt.Key_Right:
            overallSelectedIndex = moveRight(overallSelectedIndex);
//            if(selectedRow === 0) {
//                recentsSelectedIndex = moveRight(recentsSelectedIndex);
//            } else if (selectedRow === 1) {
//                topRatedSelectedIndex = moveRight(topRatedSelectedIndex);
//            } else if (selectedRow === 2) {
//                newReleasesSelectedIndex = moveRight(newReleasesSelectedIndex);
//            }
            break;
        case Qt.Key_Up:
            if(selectedRow === 0) {
                selectedRow = 2;
            } else {
                selectedRow = selectedRow - 1;
            }
            break;
        case Qt.Key_Down:
            if(selectedRow === 2) {
                selectedRow = 0;
            } else {
                selectedRow = selectedRow + 1;
            }
            break;
        case Qt.Key_Return:
            switch(selectedRow) {
            case 0:
                iScreenDetail.itemInfo = recentsElements[recentsSelectedIndex];
                break;
            case 1:
                iScreenDetail.itemInfo = topRatedElements[topRatedSelectedIndex];
                break;
            case 2:
                iScreenDetail.itemInfo = newReleasesElements[newReleasesSelectedIndex];
                break;
            default:
                break;
            }
            state = "DETAIL";
            break;
        case Qt.Key_Escape:
            console.log("Trying to escape with state " + stateReady);
            if(stateReady)
                iRoot.setState("GUIDE");
            else
                stateReady = true;
            break;
        }

        if(selectedRow === 0) {
            recentsSelectedIndex = overallSelectedIndex;
            topRatedSelectedIndex = -1;
            newReleasesSelectedIndex = -1;
        } else if (selectedRow === 1) {
            recentsSelectedIndex = -1;
            topRatedSelectedIndex = overallSelectedIndex;
            newReleasesSelectedIndex = -1;
        } else if (selectedRow === 2) {
            recentsSelectedIndex = -1;
            topRatedSelectedIndex = -1;
            newReleasesSelectedIndex = overallSelectedIndex;
        }
    }

    states: [
        State {
            name: "BROWSE"
            PropertyChanges {
                target: iScreenDetail; opacity: 0.0; focus: false
            }
            PropertyChanges {
                target: iBrowse; opacity: 1.0; focus: true; stateReady: false
            }
        },
        State {
            name: "DETAIL"
            PropertyChanges {
                target: iScreenDetail; opacity: 1.0; focus: true
            }
            PropertyChanges {
                target: iBrowse; opacity: 1.0; focus: false; stateReady: false
            }
        }
    ]

    TitleBar {
        id: iBrowseTitle
        title: "Browse for " + mediaType
        width: parent.width
        height: parent.height
        color: "#333333"
    }

    //recents
    BrowseRow {
        id: iRecentsRow
        y: 0.15*parent.height
        x: 0.05*parent.width
        rowLabel: if (mediaType=== "Music")
                      return "Recently Listened"
                  else if (mediaType=== "Apps")
                      return "Recently Used"
                  else return "Recently Watched"
        elements: iBrowse.recentsElements
        isSquare: false
        selectedIndex: recentsSelectedIndex
    }
    BrowseRow {
        id: iTopRatedRow
        anchors.top: iRecentsRow.bottom
        anchors.topMargin: 75
        x: 0.05*parent.width
        rowLabel: "Top Rated"
        elements: iBrowse.topRatedElements
        isSquare: false
        selectedIndex: topRatedSelectedIndex
    }

    BrowseRow {
        id: iNewReleasesRow
        anchors.top: iTopRatedRow.bottom
        anchors.topMargin: 75
        x: 0.05*parent.width
        rowLabel: "New Releases"
        elements: iBrowse.newReleasesElements
        isSquare: false
        selectedIndex: newReleasesSelectedIndex

    }

    Detail {
        id: iScreenDetail
        anchors.fill: parent
        opacity: 0.0
        onBack: iBrowse.state = "BROWSE"
        itemInfo: topRatedElements[0]
    }

}
