import QtQuick 2.0

Rectangle {
    TextWithFont {
        id: iComingSoonText
        text: qsTr("Coming Soon!")
        font.pixelSize: 48
        anchors.centerIn: parent
    }

    Keys.onPressed: {
        if(event.key === Qt.Key_Escape)
            iRoot.setState("GUIDE");
    }
}
