import QtQuick 2.9

Item {
    function getScale() {
        var scaleX = background.width/background.sourceSize.width
        var scaleY = background.height/background.sourceSize.height
        return scaleX < scaleY ? scaleX : scaleY
    }

    Rectangle {
        width: parent.width
        height: parent.height
        color: "#070707"
    }

    Image {
        id: background
        width: parent.width
        height: parent.height
        fillMode: Image.PreserveAspectFit
        source: "../watchfaces-img/background.png"
    }

    Image {
        property int currentImage: 1
        id: image
        //x: parent.width * 0.53
        //x: (parent.width - (background.sourceSize.width * getScale()))/2 + (getScale() * 0.53 * background.sourceSize.width);// v simplified -1 + 2*0.53 = 0.06
        x: (parent.width + 0.06 * (background.sourceSize.width * getScale())) / 2
        //y: parent.height * 0.64
        //y: (parent.height - (background.sourceSize.height * getScale()))/2 + (getScale() * 0.64 * background.sourceSize.height) // -1 + 2*0.64
        y: (parent.height + 0.28 * (background.sourceSize.height * getScale())) / 2
        width: getScale() * sourceSize.width
        height: getScale() * sourceSize.height
        source: "../watchfaces-img/food_"+currentImage+".png"
        NumberAnimation on currentImage {
            loops: Animation.Infinite
            from: 1
            to: 15
            duration: 1600
        }
    }

    Image {
        id: imageHour
        x: (parent.width / 2) - width / 2
        y: (parent.height / 2) - height
        width: getScale() * sourceSize.width
        height: getScale() * sourceSize.height
        source: "../watchfaces-img/hour_hand.png"
        transform: Rotation {
            angle: (wallClock.time.toLocaleString(Qt.locale(), "hh ap").slice(0, 2) * 60 + wallClock.time.toLocaleString(Qt.locale(), "mm").slice(0, 2)) / 2
            origin.x: imageHour.width / 2
            origin.y: imageHour.height
        }
    }
    Image {
        id: imageMinute
        x: (parent.width / 2) - width / 2
        y: (parent.height / 2) - height
        width: getScale() * sourceSize.width
        height: getScale() * sourceSize.height
        source: "../watchfaces-img/minute_hand.png"
        transform: Rotation {
            angle: wallClock.time.toLocaleString(Qt.locale(), "mm").slice(0, 2) * 6
            origin.x: imageMinute.width / 2
            origin.y: imageMinute.height
        }
    }
}
