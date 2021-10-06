import QtQuick 2.0
import QtQuick.Controls 2.4
import "../../qml/controls"
import QtQuick.Layouts 1.0




Item {
    Rectangle {
        id: rectangle
        width: 1200
        height: 700
        color: "#3f4243"
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        property bool fileCheck: false



        Rectangle {
            id: homeContents
            color: "#343434"
            radius: 20
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: imageHolder.bottom
            anchors.bottom: parent.bottom
            anchors.rightMargin: 50
            anchors.leftMargin: 50
            anchors.bottomMargin: 50
            anchors.topMargin: 30

            Label {
                id: welcomeLabel
                height: 64
                color: "#8b9299"
                text: qsTr("Settings")
                anchors.top: parent.top
                font.letterSpacing: 2.1
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.weight: Font.DemiBold
                anchors.topMargin: 40
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                font.wordSpacing: 0
                font.pointSize: 35
            }

            Label {
                id: browseLabel
                color: "#c9c7c7"
                text: "Please select the File option in the Left Menu."
                anchors.bottom: parent.bottom
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.weight: Font.DemiBold
                anchors.bottomMargin: 79
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 15

            }

            Rectangle {
                id: timeHolder
                x: 305
                y: 89
                width: 410
                height: 130
                color: "#3b3e3f"
                radius: 10
                border.width: 0
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                visible: false

                Label {
                    id: labelDate
                    x: 171
                    width: 200
                    height: 50
                    color: "#c1b9b9"
                    text: "00/00/0000"
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ticking Timebomb BB"
                    anchors.bottomMargin: 84
                    anchors.topMargin: 13
                    anchors.horizontalCenterOffset: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 25
                    visible:false
                }

                Label {
                    id: labelTime
                    x: 162
                    width: 250
                    height: 150
                    color: "#7fe759"
                    text: "00:00:00"
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ticking Timebomb BB"
                    font.weight: Font.DemiBold
                    anchors.bottomMargin: 8
                    anchors.topMargin: 52
                    anchors.horizontalCenterOffset: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 50
                    visible: false
                }
            }

        }

        Rectangle {
            id: imageHolder
            x: 0
            y: 0
            height: 50
            color: "#3f4243"
            radius: 0
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 0

            Image {
                id: image
                height: 40
                anchors.left: parent.left
                anchors.top: parent.top
                source: "../../images/electro-pi-title.png"
                smooth: true
                mirror: false
                anchors.leftMargin: 5
                anchors.topMargin: 5
                fillMode: Image.PreserveAspectFit
            }
            anchors.topMargin: 5
        }

    }

    Connections{
        target: backend

        function onPrintTime(time){
            labelTime.text = time
        }

        function onPrintDate(date){
            labelDate.text = date
        }

        function onFileCheck(check){
            rectangle.fileCheck = check

            if (rectangle.fileCheck === true){
                browseLabel.text = 'File located.'
            }
            else{
                browseLabel.text = 'There was an error locating the specified file. Please try again.'
            }
        }

        }
    }





/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.75;height:700;width:1200}
}
##^##*/
