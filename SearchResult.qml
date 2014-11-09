import QtQuick 2.0

Rectangle {
    id: iSearchResult
    property string title: ""
    property string service: ""
    property string imageURL: ""

    Image {
        id: iImage
        source: "./images/" + iSearchResult.imageURL
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        fillMode: Image.PreserveAspectFit
    }

    TextWithFont {
        text: iSearchResult.title
        anchors.top: parent.top
        anchors.left: iImage.right
        anchors.leftMargin: iImage.width / 3
        font.pixelSize: 21
    }

    TextWithFont {
        text: iSearchResult.service
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        font.pixelSize: 18
    }
}
