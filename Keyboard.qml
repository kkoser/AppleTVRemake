import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

Grid {
    id: iKeyboard
    width: 360
    height: 360
    focus: true

    property string keys: "ABCDEFGHIJKLMNOPQRSTUVWXYZ.,/?"
    property int selectedKey: 0

    signal hideKeyboard()
    signal letterClicked(string letter)

    Keys.onPressed: {
        switch(event.key) {
        case Qt.Key_Left:
            var col = selectedKey % columns;
            if(col <= 0)
                selectedKey += columns - 1;
            else
                selectedKey--;
            break;
        case Qt.Key_Right:
            var col = selectedKey % columns;
            if(col >= columns - 1)
                selectedKey -= columns -1
            else
                selectedKey++;
            break;
        case Qt.Key_Up:
            if(selectedKey >= columns) {
                selectedKey -= columns;
            }
            break;
        case Qt.Key_Down:
            if(selectedKey + columns < keys.length)
                selectedKey += columns;
            else
                selectedKey = selectedKey % columns;
            break;
        case Qt.Key_Return:
            letterClicked(keys.charAt(selectedKey));
            console.log(keys.charAt(selectedKey));
            break;
        }
    }

    rows: 6
    columns: 5

    Repeater {
        model: keys.length
        Button {
            property bool selected: index == selectedKey
            width: 70
            height: 70
            style: ButtonStyle {
                background: Rectangle {
                    color: "#333333"
                    border.width: selected ? .5 : 0
                    border.color: "white"
                }
            }

            Text{
                anchors.centerIn: parent
                color: "white"
                text: {
                    keys.charAt( index );
                }
            }
            onClicked: {
                selectedKey = index;
                letterClicked( keys.charAt(index) )
            }
        }
    }
}
