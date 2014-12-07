import QtQuick 2.0
import QtQuick.Controls 1.2

Rectangle {
    id: iSettings

    Keys.onPressed: {
        if(event.key === Qt.Key_Escape || event.key === Qt.Key_G)
            iRoot.setState("GUIDE");
    }
    TextWithFont {
        text: "YOU FOUND THE SETTINGS"
        color: "white"
        anchors.centerIn: parent
        font.pixelSize: 30
    }
}
