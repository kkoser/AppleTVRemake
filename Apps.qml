import QtQuick 2.0

Rectangle {
    TextWithFont {
        id: iComingSoonText
        text: qsTr("The Settings App would be found here.")
        font.pixelSize: 48
        anchors.centerIn: parent
    }

    Keys.onPressed: {
        if(event.key === Qt.Key_Escape || event.key === Qt.Key_G)
            iRoot.setState("GUIDE");
    }
}
