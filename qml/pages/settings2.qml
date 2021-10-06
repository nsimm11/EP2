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
                text: qsTr("Welcome")
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
                anchors.verticalCenterOffset: -51
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter

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
                }
            }


            Button {
                id: button
                x: 416
                y: 315
                width: 265
                height: 80

                ColorAnimation {
                    from: "#7fe759"
                    to: "#7fe759"
                    duration: 2
                }
                text: qsTr("START TEST")
                font.letterSpacing: 0.3
                flat: false
                highlighted: false
                font.pointSize: 21
                font.family: "Arial"
            }
        }

        Rectangle {
            id: imageHolder
            x: 40
            y: 45
            height: 100
            color: "#3f4243"
            radius: 20
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 20
            anchors.leftMargin: 20

            Image {
                id: image
                height: 97
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                source: "../../images/electro-pi-title.png"
                smooth: true
                mirror: false
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                anchors.topMargin: 10
                fillMode: Image.PreserveAspectFit
            }
            anchors.topMargin: 25
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
    D{i:0;autoSize:true;formeditorZoom:0.9;height:700;width:1200}
}
##^##*/
