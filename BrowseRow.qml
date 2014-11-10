import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2


Rectangle {
    property alias rowLabel: iRowLabel.text
    property variant elements
    property bool isSquare: false
    property int rowHeight: isSquare ? 140 : 190
    property int selectedIndex: -1

    implicitHeight: rowHeight

    TextWithFont {
        id: iRowLabel
        font.pixelSize: 21
        anchors.top: parent.top
        anchors.left: parent.left
        font.weight: Font.Normal

    }

    Row {
        anchors.top: iRowLabel.bottom
        anchors.topMargin: 15
        anchors.left: iRowLabel.left
        spacing: 30

        Repeater {
            model: elements.length

            Button {
                width: 120
                height: rowHeight
                style: ButtonStyle {
                    background: Rectangle {
                        color: "#333333"
                        border.width: selectedIndex === index ? 0.5 : 0.0
                        border.color: "white"
                        radius: 5
                    }
                }
                Image {
                    source: elements[index]["posterURL"]
                    height: parent.height - 30
                    width: parent.width
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 10
                    fillMode: Image.PreserveAspectFit
                }
                TextWithFont {
                    text: elements[index]["name"]
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottomMargin: 5
                    anchors.leftMargin: 5
                    anchors.rightMargin: 5
                    font.pixelSize: 16
                    width: parent.width
                    elide: Text.ElideRight
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }
    }
}
