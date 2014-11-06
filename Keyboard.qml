import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

Grid {
    id: iKeyboard
    width: 360
    height: 360

    property string keys: "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

    signal hideKeyboard()
    signal letterClicked(string letter)

    rows: 6
    columns: 5
    spacing: 1

    Repeater {
        model: keys.length + 1
        Button {
            width: 70
            height: 70
            style: ButtonStyle {
                background: Item {}
            }

            Text{
                color: "white"
                text: {
                    if ( index == 0 )
                        return "<"
                    else
                        keys.charAt( index - 1 );
                }
                anchors.fill: parent
            }
            onClicked: {
                if ( index == 0 )
                    hideKeyboard()
                else {
                    letterClicked( label )
                }
            }
        }
    }
}
