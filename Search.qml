import QtQuick 2.0

// @note This class is tightly coupled to the iRoot item in main.qml, as this is needed
// to handle going back to the main screen.
Rectangle {
    id: iSearch
    Keys.onPressed: if(event.key === Qt.Key_Escape) iRoot.state = "GUIDE"

    TitleBar {
        width: parent.width
        height: parent.height / 10
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: parent.height / 20
        color: "#333333"

        title: "Search"
    }

    Keyboard {
        keybaordEnabled: iSearch.focus
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
    }
}
