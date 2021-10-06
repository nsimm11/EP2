import QtQuick 2.11
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.0

Button{
    id: btnLeftMenu
    text: qsTr("Left Menu Text")

    //CUSTOM PROPERTIES
    property url btnIconSource: "../../images/svg_images/home_icon.svg"
    property color btnColorDefault: "#1c1d20"
    property color btnColorMouseOver: "#23272E"
    property color btnColorClicked: "#305724"
    property int iconWidth: 18
    property int iconHeight: 18
    property color activeMenuColorLeft: "#7bcb04"
    property color activeMenuColorRight: "#3f4243"
    property bool isActiveMenu: true


    QtObject {
        id:internal

        //MOUSEOVER AND CLICK CHANGE COLOR
        property var dynamicColor: if(btnLeftMenu.down){
                                       btnLeftMenu.down ? btnColorClicked : btnColorDefault
                                   } else {
                                       btnLeftMenu.hovered ? btnColorMouseOver : btnColorDefault
                                   }

    }

    implicitWidth: 250
    implicitHeight: 60

    background: Rectangle{
        id: bgBtn
        color: internal.dynamicColor

        Rectangle{
            anchors{
                top: parent.top
                left: parent.left
                bottom: parent.bottom
            }
            width: 5
            radius: 5
            visible: isActiveMenu
            color: "#7bcb04"

            Rectangle{
                anchors{
                    top: parent.top
                    left: parent.left
                    bottom: parent.bottom
                }
                width: 4
                visible: isActiveMenu
                color: "#7bcb04"
            }
        }

        Rectangle{
            anchors{
                top: parent.top
                right: parent.right
                bottom: parent.bottom
            }
            color: activeMenuColorRight
            width: 5
            radius: 5
            visible: isActiveMenu
        }
        Rectangle{
            anchors{
                top: parent.top
                right: parent.right
                bottom: parent.bottom
            }
            color: activeMenuColorRight
            width: 4
            visible: isActiveMenu
        }
    }

    contentItem: Item{
        anchors.fill: parent
        id: content
    }

        Image {
            id: iconBtn
            source: btnIconSource
            anchors.leftMargin: 26
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            sourceSize.height: iconHeight
            sourceSize.width: iconWidth
            height: iconHeight
            width: iconWidth
            fillMode: Image.PreserveAspectFit
            visible: false
            antialiasing: true
        }

        ColorOverlay{
            anchors.fill: iconBtn
            source: iconBtn
            color: "#ffffff"
            antialiasing: true
            width: iconWidth
            height: iconHeight
        }

        Text{
            color: "#ffffff"
            text: btnLeftMenu.text
            font: btnLeftMenu.font
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 75
        }
    }



/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:1.66;height:60;width:250}
}
##^##*/
