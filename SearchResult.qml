import QtQuick 2.0

Rectangle {
    id: iSearchResult
    property string title: ""
    property string service: ""
    property string imageURL: ""
    property bool selected: false

    border.color: "white"
    border.width: selected ? .5 : 0
    radius: 5

    Image {
        id: iImage
        source: iSearchResult.imageURL
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
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
