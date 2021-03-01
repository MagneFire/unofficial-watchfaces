import QtQuick 2.9
import org.asteroid.utils 1.0
import org.asteroid.controls 1.0

Item {
    Rectangle {
        x: DeviceInfo.hasRoundScreen ? parent.width * 0.1 : 0
        y: DeviceInfo.hasRoundScreen ? parent.height * 0.1 : 0
        width: DeviceInfo.hasRoundScreen ? parent.width * 0.8 : parent.width
        height: DeviceInfo.hasRoundScreen ? parent.height * 0.8 : parent.height
        color: "#000000"
        Rectangle {
            x: topLeft.x
            y: topLeft.y
            width: topLeft.width
            height: topLeft.height
            color: "#b0e60d"
        }
        Rectangle {
            x: topRight.x
            y: topRight.y
            width: topRight.width
            height: topRight.height
            color: "#b0e60d"
        }
        Rectangle {
            x: bottomLeft.x
            y: bottomLeft.y
            width: bottomLeft.width
            height: bottomLeft.height
            color: "#ffffff"
        }
        Rectangle {
            x: bottomRight.x
            y: bottomRight.y
            width: bottomRight.width
            height: bottomRight.height
            color: "#ffffff"
        }
        Item {
            anchors.fill: parent
            Image {
                id: topLeft
                x: parent.width*0.06
                y: parent.height*0.08
                width: parent.width/2 - parent.width*0.12
                height: parent.height/2 - parent.height*0.114
                source: "../watchfaces-img/neon" + wallClock.time.toLocaleString(Qt.locale(), "HH").slice(0, 1) + ".png"
            }
            Image {
                id: topRight
                x: parent.width/2 + parent.width*0.048
                y: parent.height*0.08
                width: parent.width/2 - parent.width*0.116
                height: parent.height/2 - parent.height*0.122
                source: "../watchfaces-img/neon" + wallClock.time.toLocaleString(Qt.locale(), "HH").slice(1, 2) + ".png"
            }
            Image {
                id: bottomLeft
                x: parent.width*0.058
                y: parent.height/2 + parent.height*0.036
                width: parent.width/2 - parent.width*0.11
                height: parent.height/2 - parent.height*0.126
                source: "../watchfaces-img/neon" + wallClock.time.toLocaleString(Qt.locale(), "mm").slice(0, 1) + ".png"
            }
            Image {
                id: bottomRight
                x: parent.width/2 + parent.width*0.048
                y: parent.height/2 + parent.height*0.036
                width: parent.width/2 - parent.width*0.115
                height: parent.height/2 - parent.height*0.126
                source: "../watchfaces-img/neon" + wallClock.time.toLocaleString(Qt.locale(), "mm").slice(1, 2) + ".png"
            }
        }
    }
}
