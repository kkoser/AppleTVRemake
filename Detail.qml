import QtQuick 2.0

Rectangle {

    id: iDetail

    property var itemInfo: ({})

    signal back();

    Keys.onPressed: {
        if(event.key == Qt.Key_G)
            iRoot.state = "GUIDE"
        if(event.key === Qt.Key_Escape) {
            console.log("Detail back"); iDetail.back();
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

    Grid {
        id: iGrid3
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height/8
        anchors.left: parent.left
        anchors.right: parent.right
        spacing: 10

        rows: 1
        columns: 2

        Image {
            id: iImage2
            source: itemInfo["posterURL"]
            anchors.top: parent.top
            anchors.topMargin: 120
            anchors.left: parent.left
            anchors.leftMargin: iDetailTitle.leftMargin
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 100
            width: 1/3*parent.width
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            TextWithFont {
                text: "The Lego Movie is really good and is about a group of Legos who do awesome"
                anchors.top: parent.top
                anchors.topMargin: 125
                anchors.left: parent.left
                anchors.leftMargin: 450
                font.pixelSize: 21
            }
            TextWithFont {
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
            }

            TextWithFont {
                color: "white"
                text: "▶"
                anchors.top: parent.top
                anchors.topMargin: 489
                anchors.left: parent.left
                anchors.leftMargin: 738
                font.pixelSize: 24
            }

            TextWithFont {
                color: "white"
                text: "Play"
                anchors.top: parent.top
                anchors.topMargin: 480
                anchors.left: parent.left
                anchors.leftMargin: 770
                font.pixelSize: 36
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

            Rectangle {
                Image {
                    id: iImage3
                    source: "./images/tomato.png"
                    anchors.top: parent.top
                    anchors.topMargin: 580
                    anchors.left: parent.left
                    anchors.leftMargin: 280
                    width: 25
                    height: 25
                    fillMode: Image.PreserveAspectFit
                }
            }

            TextWithFont {
                color: "white"
                text: "96%"
                anchors.top: parent.top
                anchors.topMargin: 580
                anchors.left: parent.left
                anchors.leftMargin: 315
                font.pixelSize: 24
            }

            Grid {
                anchors.top: parent.top
                anchors.topMargin: 220
                anchors.left: parent.left
                anchors.leftMargin: 455
                spacing: 5
                width: 400

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
        }
    }
}
