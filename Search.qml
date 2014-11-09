import QtQuick 2.0

// @note This class is tightly coupled to the iRoot item in main.qml, as this is needed
// to handle going back to the main screen.
Rectangle {
    id: iSearch
    Keys.onPressed: if(event.key === Qt.Key_Escape) iRoot.state = "GUIDE"

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

    Text {
        id: iTextSearch
        text: ""
        anchors.top: parent.top
        anchors.topMargin: iTitleBar.height *1.3
        anchors.left: parent.left
        anchors.leftMargin: parent.width/20
        width: iKeyboard.width
        color: "white"
        font.pixelSize: 20
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
        anchors.left: parent.left
        anchors.top: iTextSearch.bottom
        anchors.leftMargin: parent.width / 20
        anchors.topMargin: parent.height / 15
        onLetterClicked: iTextSearch.text += letter
    }


    // Results section

    TitleBar {
        id: iResultsTitle
        width: parent.width / 2
        anchors.right: iTitleBar.right
        height: parent.height / 10
        anchors.top: iTitleBar.bottom
        //anchors.topMargin: height / 10
        color: "#333333"

        title: "Results"
    }

    Column {
        width: parent.width/2
        anchors.right: iTitleBar.right
        anchors.top: iResultsTitle.bottom
        spacing: 2

        SearchResult{
            title: "Lego Movie"
            service: "Netflix"
            imageURL: "LegoMovie.jpg"
            width: iResultsTitle.width
            height: 200
            color: "#333333"
        }
    }

}
