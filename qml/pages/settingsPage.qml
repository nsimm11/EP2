import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12
import QtQuick.Controls.Material 2.12

Window {
    id: page
    width: 800
    height: 400
    visible: true

            TextField {
                id: textField
                x: 204
                y: 58
                width: 521
                height: 40
                text: qsTr("Batch Id")
            }

            Text {
                id: leftlabel2
                x: 26
                y: 14
                color: "#075102"
                text: "Batch Setup - Admin Settings"
                font.pointSize: 16
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredHeight: 100
                Material.accent: Material.Green
            }

            Button {
                id: button
                x: 17
                y: 345
                text: qsTr("SUBMIT")
                onClicked: {
                    win.getSubmit(button.text)}

            }

            Button {
                id: button1
                x: 695
                y: 349
                text: qsTr("Next Page")
                anchors.fill: parent
                anchors.rightMargin: 19
                anchors.bottomMargin: 20
                anchors.leftMargin: 684
                anchors.topMargin: 350
                onClicked: {
                    win.getSubmit(button1.text)}
            }

            TextField {
                id: textField1
                x: 204
                y: 114
                width: 521
                height: 40
                text: qsTr("Date (MM/DD/YY)")
            }

            TextField {
                id: textField2
                x: 204
                y: 171
                width: 521
                height: 125
                text: qsTr("Notes")
            }

            Text {
                id: text1
                x: 26
                y: 58
                width: 146
                height: 28
                color: "#075102"
                text: qsTr("BATCH ID")
                font.pixelSize: 16
            }

            Text {
                id: text2
                x: 26
                y: 114
                width: 146
                height: 28
                color: "#075102"
                text: qsTr("DATE")
                font.pixelSize: 16
            }

            Text {
                id: text3
                x: 26
                y: 171
                width: 146
                height: 28
                color: "#075102"
                text: qsTr("NOTES")
                font.pixelSize: 16
            }

}
