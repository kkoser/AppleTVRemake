import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

Rectangle {
    id: iKeyboard
    property string keys: "ABCDEFGHIJKLMNOPQRSTUVWXYZ., "
    property int selectedKey: keys.length + 2
    property alias keybaordEnabled: iGrid.focus
    property bool showSelectButton: true
    property bool allowsScrollingOff: false
    property bool showSelector: true

    signal letterClicked(string letter)
    signal submitClicked()
    signal deleteClicked()
    signal cursorMovedOffRight()

    function enterFromRight() {
        console.log("Entering from right");
        selectedKey -= 1;
    }

    onSelectedKeyChanged: console.log(selectedKey);

    width: 360
    height: 500
    focus: true
    color: "#333333"

    Grid {
        id: iGrid
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height/8
        anchors.left: parent.left
        anchors.right: parent.right

        focus: true

        Keys.onPressed: {
            switch(event.key) {
            case Qt.Key_Left:
                if(selectedKey == keys.length +1)
                    break; //Submit button, so cant go left or right
                var col = selectedKey % columns;
                if(col <= 0)
                    selectedKey += columns - 1;
                else
                    selectedKey--;
                break;
            case Qt.Key_Right:
                if(selectedKey == keys.length +1)
                    break; //Submit button, so cant go left or right
                var col = selectedKey % columns;
                if(col >= columns - 1) {
                    if(allowsScrollingOff)
                        cursorMovedOffRight();
                    else
                        selectedKey -= columns -1
                }
                else
                    selectedKey++;
                break;
            case Qt.Key_Up:
                if(selectedKey >= columns) {
                    selectedKey -= columns;
                }
                break;
            case Qt.Key_Down:
                if(selectedKey + columns < keys.length + 1)
                    selectedKey += columns;
                else if(showSelectButton)
                    selectedKey = keys.length + 2; //The submit button
                break;
            case Qt.Key_Return:
                if(selectedKey < keys.length)
                    letterClicked(keys.charAt(selectedKey));
                else if(selectedKey === keys.length)
                    deleteClicked();
                else
                    submitClicked();
                break;
            }
        }

        rows: 6
        columns: 5

        Repeater {
            model: keys.length + 1
            Button {
                property bool selected: index == selectedKey
                width: 70
                height: 70
                style: ButtonStyle {
                    background: Rectangle {
                        color: "#333333"
                        border.width: (selected && showSelector) ? .5 : 0
                        border.color: "white"
                        radius: 5
                    }
                }

                TextWithFont {
                    anchors.centerIn: parent
                    font.pixelSize: 16
                    text: index < keys.length ? keys[index] : "Delete"
                }
                onClicked: {
                    if(index < keys.length) {
                        letterClicked(keys[index]);
                    }
                    else {
                        deleteClicked();
                    }
                }
            }
        }
    }

    Button {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width / 2.5
        height: parent.height / 10
        visible: showSelectButton
        style: ButtonStyle {
            background: Rectangle {
                color: "#333333"
                border.width: showSelector && selectedKey === keys.length + 2
                border.color: "white"
                radius: 5
            }
        }

        TextWithFont {
            anchors.centerIn: parent
            text: "Voice Search"
            font.pixelSize: 21
        }
        onClicked: {
            selectedKey = keys.length + 1;
            submitClicked();
        }
    }

}

