import QtQuick 2.0

Rectangle {

    id: iDetail

    Component.onCompleted: iEpisodeListView.currentIndex = 0;

    property var itemInfo: ({})
    property var episodes: ["Episode 1", "Episode 2", "Episode 3", "Episode 4", "Episode 5", "Episode 6"]

    signal back();

    Keys.onPressed: {
        if(event.key == Qt.Key_G)
            iRoot.setState("GUIDE");
        if(event.key === Qt.Key_Escape) {
            console.log("Detail back"); iDetail.back();
        }

        if(itemInfo["mediaType"] !== "Movie") {
            switch(event.key) {
            case Qt.Key_Up:
                iEpisodeListView.currentIndex -= 1;
                break;
            case Qt.Key_Down:
                iEpisodeListView.currentIndex += 1;
                break;
            }
        }
    }

    Behavior on opacity {
        NumberAnimation { duration: 200 }
    }

    TitleBar {
        id: iDetailTitle
        width: parent.width
        height: parent.height
        color: "#333333"
        title: itemInfo["name"]
    }

    TextWithFont {
        color: "white"
        text: itemInfo["source"]
        anchors.top: parent.top
        anchors.topMargin: 43
        anchors.left: parent.left
        anchors.leftMargin: 1142
        font.pixelSize: 18
    }

    Image {
        id: iImagePoster
        source: itemInfo["posterURL"]
        anchors.top: parent.top
        anchors.topMargin: 120
        anchors.left: parent.left
        anchors.leftMargin: iDetailTitle.leftMargin
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 150
        width: 1/3*parent.width
        fillMode: Image.PreserveAspectFit
    }

    TextWithFont {
        text: "The Lego Movie is really good and is about a group of Legos who do awesome"
        anchors.top: parent.top
        anchors.topMargin: 125
        anchors.left: parent.left
        anchors.leftMargin: 450
        font.pixelSize: 21
    }
    TextWithFont {
        id: iDescriptionBottom
        text: "stuff. It's funny sometimes and has Batman in it. Also, spaceships."
        anchors.top: parent.top
        anchors.topMargin: 155
        anchors.left: parent.left
        anchors.leftMargin: 450
        font.pixelSize: 21
    }

    Rectangle {
        anchors.top: parent.top
        anchors.topMargin: 473
        anchors.left: parent.left
        anchors.leftMargin: 712
        color: "#333333"
        border.width: .9
        border.color: "white"
        radius: 5
        width: 150
        height: 60
        visible: itemInfo["mediaType"] === "Movie"
    }

    TextWithFont {
        color: "white"
        text: "▶"
        anchors.top: parent.top
        anchors.topMargin: 489
        anchors.left: parent.left
        anchors.leftMargin: 738
        font.pixelSize: 24
        visible: itemInfo["mediaType"] === "Movie"
    }

    TextWithFont {
        color: "white"
        text: "Play"
        anchors.top: parent.top
        anchors.topMargin: 480
        anchors.left: parent.left
        anchors.leftMargin: 770
        font.pixelSize: 36
        visible: itemInfo["mediaType"] === "Movie"
    }

    Rectangle {
        height: 0.3
        width: 720
        anchors.top: parent.top
        anchors.topMargin: 200
        anchors.left: parent.left
        anchors.leftMargin: 450
    }

    TextWithFont {
        color: "white"
        text: "★★★★☆"
        anchors.top: parent.top
        anchors.topMargin: 580
        anchors.left: parent.left
        anchors.leftMargin: 75
        font.pixelSize: 24
    }

//            Rectangle {
//                Image {
//                    id: iImage3
//                    source: "./images/tomato.png"
//                    anchors.top: parent.top
//                    anchors.topMargin: 580
//                    anchors.left: parent.left
//                    anchors.leftMargin: 280
//                    width: 25
//                    height: 25
//                    fillMode: Image.PreserveAspectFit
//                }
//            }

//            TextWithFont {
//                color: "white"
//                text: "96%"
//                anchors.top: parent.top
//                anchors.topMargin: 580
//                anchors.left: parent.left
//                anchors.leftMargin: 315
//                font.pixelSize: 24
//            }

    Grid {
        id: iGridDetailList
        anchors.top: parent.top
        anchors.topMargin: 220
        anchors.left: parent.left
        anchors.leftMargin: 455
        spacing: 5
        width: 400

        visible: itemInfo["mediaType"] === "Movie"

        rows: 6
        columns: 3

        TextWithFont {
            color: "white"
            width: 280
            text: "<b>Details</b>"
            font.pixelSize: 18
        }
        TextWithFont {
            color: "white"
            width: 280
            text: "<b>Actors</b>"
            font.pixelSize: 18
        }
        TextWithFont {
            color: "white"
            width: 280
            text: "<b>Directors</b>"
            font.pixelSize: 18
        }
        TextWithFont {
            color: "white"
            text: "Comedy & Animation"
            font.pixelSize: 18
        }
        TextWithFont {
            color: "white"
            text: "Chris Pratt"
            font.pixelSize: 18
        }
        TextWithFont {
            color: "white"
            text: "Phil Lord"
            font.pixelSize: 18
        }
        TextWithFont {
            color: "white"
            text: "Released 2014"
            font.pixelSize: 18
        }
        TextWithFont {
            color: "white"
            text: "Will Arnett"
            font.pixelSize: 18
        }
        TextWithFont {
            color: "white"
            text: "Christopher Miller"
            font.pixelSize: 18
        }
        TextWithFont {
            color: "white"
            text: "100 Minutes"
            font.pixelSize: 18
        }
        TextWithFont {
            color: "white"
            text: "Elizabeth Banks"
            font.pixelSize: 18
        }
        TextWithFont {
            color: "white"
            text: " "
            font.pixelSize: 18
        }
        TextWithFont {
            color: "white"
            text: "PG"
            font.pixelSize: 18
        }
        TextWithFont {
            color: "white"
            text: "Will Ferrell"
            font.pixelSize: 18
        }
        TextWithFont {
            color: "white"
            text: " "
            font.pixelSize: 18
        }
        TextWithFont {
            color: "white"
            text: " "
            font.pixelSize: 18
        }
        TextWithFont {
            color: "white"
            text: "Morgan Freeman"
            font.pixelSize: 18
        }
    }

    Rectangle {
        id: iEpisodeDivider
        height: 1
        color: "white"
        anchors.left: iEpisodeListItem.left
        anchors.right: iEpisodeDescriptionItem.right
        anchors.rightMargin: 20
        anchors.top: iDescriptionBottom.bottom
        anchors.topMargin: 10
        visible: iDetail.itemInfo["mediaType"] !== "Movie"

    }

    Item {
        id: iEpisodeListItem

        anchors.top: iDescriptionBottom.bottom
        anchors.topMargin: 20
        anchors.left: iImagePoster.right
        anchors.leftMargin: 20
        width: parent.width/3
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20

        visible: iDetail.itemInfo["mediaType"] !== "Movie"

        TextWithFont {
            id: iTextSeason
            anchors.top: parent.top
            anchors.left: parent.left
            text: "Season 1"
            font.pixelSize: 24
        }

        ListView {
            id: iEpisodeListView

            anchors.top: iTextSeason.bottom
            anchors.topMargin: 20
            anchors.left: parent.left
            anchors.right: parent.right
            //width: parent.width
            anchors.bottom: parent.bottom

            currentIndex: 0

            // Need to update the description text here
            onCurrentIndexChanged: {

            }

            model: iDetail.episodes.length
            delegate: Rectangle {
                color: "#333333"
                width: iEpisodeListItem.width
                height: iEpisodeListItem.height / 10
                TextWithFont {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    anchors.right: parent.right
                    text: iDetail.episodes[index]
                    //text: "EPISODESSSS"
                    font.pixelSize: 20
                }

                TextWithFont {
                    color: "white"
                    text: "▶"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 20
                    font.pixelSize: 24
                    horizontalAlignment: Text.AlignRight
                }

                border.width: {
                    console.log(index + " : " + iEpisodeListView.currentIndex);
                    return iEpisodeListView.currentIndex === index ? .5: 0;
                }
                border.color: "white"
                radius: 5
                border.onWidthChanged: console.log("Border width: " + width + " for " + index + " : " + iEpisodeListView.currentIndex);
            }
        }
    }

    Item {
        id: iEpisodeDescriptionItem
        anchors.left: iEpisodeListItem.right
        anchors.leftMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.top: iEpisodeDivider.bottom
        anchors.topMargin: 50
        //anchors.bottom: parent.bottom
        //anchors.bottomMargin: 20

        visible: iDetail.itemInfo["mediaType"] !== "Movie"

       TextWithFont {
           anchors.fill: parent
           text: iDetail.episodes[iEpisodeListView.currentIndex] + " is about blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blahblah blah"
           font.pixelSize: 20
           wrapMode: Text.WrapAtWordBoundaryOrAnywhere
       }
    }
}
