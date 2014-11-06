import QtQuick 2.0

Rectangle {
    property string mediaType: ""

    Behavior on opacity {
        NumberAnimation { duration: 200 }
    }

    TitleBar {
        title: "Browse for " + mediaType
        width: parent.width
        height: parent.height
        color: "#333333"
    }

}
