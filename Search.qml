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

    TextWithFont {
        id: iTextSearch
        text: ""
        anchors.top: parent.top
        anchors.topMargin: iTitleBar.height *1.3
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
        anchors.left: parent.left
        anchors.top: iTextSearch.bottom
        anchors.leftMargin: parent.width / 20
        anchors.topMargin: parent.height / 15

        onLetterClicked: iTextSearch.text += letter
        onDeleteClicked: iTextSearch.text = iTextSearch.text.substring(0, iTextSearch.text.length - 1)
        //onDeleteClicked: console.log("Deleting letter")

        onSubmitClicked: console.log("Submitting search")
        onCursorMovedOffRight: console.log("Need to move over to search result");
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

        title: "Results"
    }

    Column {
        width: iResultsTitle.width
        anchors.right: iTitleBar.right
        anchors.top: iResultsTitle.bottom
        spacing: 2

        SearchResult{
            title: "Lego Movie"
            service: "Netflix"
            imageURL: "LegoMovie.jpg"
            width: iResultsTitle.width*.9
            height: 200
            color: "#333333"
        }
    }

}
