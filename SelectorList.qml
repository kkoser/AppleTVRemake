import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

Rectangle {
    id: iSelectorList
    property variant networks: ["ND-secure", "ND-guest", "eduroam", "other..."]
    property int i: 0 //index of networks array

    width: 360
    height: 500

    color: "#333333"


    Grid {
        id: iGrid2
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height/8
        anchors.left: parent.left
        anchors.right: parent.right
        spacing: 8

        focus: iSelectorList.focus

        Keys.onPressed: {
            switch(event.key) {
            case Qt.Key_Up:
                if(i>0){
                    i--;
                }
                break;
            case Qt.Key_Down:
                if(i<networks.length-1){
                    i++;
                }
                break;
            case Qt.Key_Return:
                console.log(networks[i] + " selected")
                break;
            }
        }

        rows: 4
        columns: 1

        Repeater {
           model: networks
            Button {
              property bool selected: modelData == networks[i]
                width: 180
                height: 40

                style: ButtonStyle {
                    background: Rectangle {
                        color: "#333333"
                        border.width: selected ? .5 : 0
                        border.color: "white"
                        radius: 5
                    }
                }

                TextWithFont {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    color: "white"
                    text: modelData
                    font.pixelSize: 21
                }
            }
        }
    }
}
