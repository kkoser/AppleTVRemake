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
        id: iTextTitle
        text: iSearchResult.title
        anchors.top: parent.top
        anchors.left: iImage.right
        anchors.leftMargin: iImage.width / 3
        font.pixelSize: 21
    }

    TextWithFont {
        text: iSearchResult.service
        anchors.left: iTextTitle.left
        anchors.top: iTextTitle.bottom
        anchors.topMargin: 10
        font.pixelSize: 18
    }
}
