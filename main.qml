import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12
import QtQuick.Controls.Material 2.12
import QtQml 2.15

Window {
    id: mainScreen
    width: 800
    height: 400
    visible: true
    property bool isClose: false

        Rectangle {
            id: settings1
            width: 800
            height: 400
            color: "#3f4243"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.horizontalCenterOffset: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
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
                anchors.bottomMargin: 103
                anchors.topMargin: -22

                Label {
                    id: welcomeLabel
                    width: 110
                    height: 33
                    color: "#8b9299"
                    text: qsTr("Welcome")
                    anchors.top: parent.top
                    font.letterSpacing: 2.1
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.weight: Font.DemiBold
                    anchors.topMargin: -202
                    anchors.horizontalCenterOffset: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.wordSpacing: 0
                    font.pointSize: 19
                }

                Rectangle {
                    id: timeHolder
                    x: 305
                    y: 89
                    width: 336
                    height: 86
                    color: "#3b3e3f"
                    radius: 10
                    border.width: 0
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.verticalCenterOffset: -81
                    anchors.horizontalCenterOffset: 0
                    anchors.horizontalCenter: parent.horizontalCenter

                    Timer {
                        interval: 1000; running: true; repeat: true;
                        onTriggered: {
                            labelDate.text = Qt.formatDate(new Date(), "MM/dd/yy");
                            labelTime.text = Qt.formatTime(new Date(), "hh:mm:ss");
                        }
                    }

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
                        font.pointSize: 20
                    }
                    Label {
                        id: labelTime
                        x: 162
                        width: 250
                        height: 150
                        color: "#7fe759"
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
                        font.pointSize: 35
                        text: {
                            updatesEnabled: labelTime.time
                                Qt.formatTime(new Date(), "hh:mm:ss")
                            }
                    }
                }


                Button {
                    id: button
                    x: 195
                    y: 8
                    width: 311
                    height: 46

                    ColorAnimation {
                        from: "#7fe759"
                        to: "#7fe759"
                        duration: 2
                    }
                    text: qsTr("START TEST")
                    font.letterSpacing: 0.3
                    flat: false
                    highlighted: false
                    font.pointSize: 12
                    font.family: "Arial"
                    onClicked: {
                        settings1.visible = false;

                        settings2.show();
                    }
                }
            }

            Text {
                id: text1
                x: 271
                y: 18
                width: 259
                height: 69
                color: "#ffffff"
                text: qsTr("Electro-Pi")
                font.pixelSize: 50
                horizontalAlignment: Text.AlignHCenter
            }


        }





    Window {
        id: settings2
        width: 800
        height: 400
        visible: false
        property bool isClose2: false

                Text {
                    id: leftlabel12
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
                    id: bSubmitAdminFields
                    x: 17
                    y: 345
                    text: qsTr("SUBMIT")
                    onClicked: {
                        win.getSubmitField(["tfBatchID", tfBatchID.text])
                        win.getSubmitField(["tfDate", tfDate.text])
                        win.getSubmitField(["tfNotes", tfNotes.text])
                    }
                }

                Button {
                    id: button111
                    x: 695
                    y: 349
                    text: qsTr("Next Page")
                    anchors.fill: parent
                    anchors.rightMargin: 19
                    anchors.bottomMargin: 20
                    anchors.leftMargin: 684
                    anchors.topMargin: 350
                    onClicked: {
                    settings2.hide();
                    settings3.show();
                    }
                }

                TextField {
                    id: tfNotes
                    x: 204
                    y: 171
                    width: 521
                    height: 125
                    text: qsTr("Notes")
                }

                TextField {
                    id: tfDate
                    x: 204
                    y: 114
                    width: 521
                    height: 40
                    text: qsTr("Date (MM/DD/YY)")
                }

                TextField {
                    id: tfBatchID
                    x: 204
                    y: 54
                    width: 521
                    height: 28
                    text: qsTr("Batch Id")
                }

                Text {
                    id: text111
                    x: 26
                    y: 58
                    width: 146
                    height: 28
                    color: "#075102"
                    text: qsTr("BATCH ID")
                    font.pixelSize: 16
                }

                Text {
                    id: text21
                    x: 26
                    y: 114
                    width: 146
                    height: 28
                    color: "#075102"
                    text: qsTr("DATE")
                    font.pixelSize: 16
                }

                Text {
                    id: text31
                    x: 26
                    y: 171
                    width: 146
                    height: 28
                    color: "#075102"
                    text: qsTr("NOTES")
                    font.pixelSize: 16
                }
    }



         Window {
             id: settings3
             width: 800
             height: 400
             visible: false
             property bool isClose3: false

         Text {
             id: text2
             x: 12
             y: 10
             width: 142
             height: 43
             color: "#0a4000"
             text: qsTr("Settings - Component Settings")
             font.pixelSize: 20
         }

         RadioButton {
             id: rbhour12
             x: 203
             y: 78
             text: qsTr("12 Hour")
             onToggled: {
                  rbhour3.font.bold = win.getBold([ rbhour3.text,  rbhour12.text])
                  rbhour6.font.bold = win.getBold([ rbhour6.text,  rbhour12.text])
                  rbhour12.font.bold = win.getBold([ rbhour12.text,  rbhour12.text])
             }
         }

         RadioButton {
             id: rbhour6
             x: 309
             y: 78
             text: qsTr("6 Hour")
             onToggled: {
                  rbhour3.font.bold = win.getBold([ rbhour3.text,  rbhour6.text])
                  rbhour6.font.bold = win.getBold([ rbhour6.text,  rbhour6.text])
                  rbhour12.font.bold = win.getBold([ rbhour12.text,  rbhour6.text])
             }
         }

         RadioButton {
             id: rbhour3
             x: 405
             y: 78
             text: qsTr("3 Hour")
             onToggled: {
                  rbhour3.font.bold = win.getBold([ rbhour3.text,  rbhour3.text])
                  rbhour6.font.bold = win.getBold([ rbhour6.text,  rbhour3.text])
                  rbhour12.font.bold = win.getBold([ rbhour12.text,  rbhour3.text])
             }
         }

         Slider {
             id: sWaveLength
             x: 504
             y: 78
             value: 0.25
             onValueChanged: {
                tWaveLength.text = win.getValueWaveLength(sWaveLength.value)
             }
         }

         Switch {
             id: swLight
             x: 45
             y: 78
             text: qsTr("OFF")
             checked: false
             font.pointSize: 10
             onToggled: {
                 swLight.text = win.getOF(swLight.text)
             }
         }

         Text {
             id: tLWLength
             x: 504
             y: 53
             width: 179
             height: 31
             color: "#003603"
             text: qsTr(" Light Wave Length:")
             font.pixelSize: 15
         }

         Text {
             id: text4
             x: 203
             y: 53
             width: 149
             height: 44
             color: "#003603"
             text: qsTr(" Light Cycle Length")
             font.pixelSize: 15
         }

         Text {
             id: text5
             x: 45
             y: 53
             width: 76
             height: 45
             color: "#003603"
             text: qsTr("Light Switch")
             font.pixelSize: 15
         }

         Button {
             id: bNextPage4
             x: 695
             y: 349
             text: qsTr("Next Page")
             anchors.fill: parent
             anchors.rightMargin: 19
             anchors.bottomMargin: 20
             anchors.leftMargin: 684
             anchors.topMargin: 350
             onClicked: {
                 onClicked: {
                     settings3.hide();
                     mainSequence.show();
                 }}
         }

         Text {
             id: tWaveLength
             x: 656
             y: 54
             width: 60
             height: 31
             text: qsTr("720 nm")
             font.pixelSize: 13
         }

         Switch {
             id: swFan
             x: 45
             y: 166
             text: qsTr("OFF")
             font.pointSize: 10
             checked: false
             onToggled: {
                 swFan.text = win.getOF(swFan.text)
             }
         }

         Text {
             id: text8
             x: 45
             y: 135
             width: 76
             height: 45
             color: "#003603"
             text: qsTr("Fan Switch")
             font.pixelSize: 15
         }

         RadioButton {
             id: rbFanSpeedH
             x: 203
             y: 161
             text: qsTr("High")
             onToggled: {
                  rbFanSpeedH.font.bold = win.getBold([ rbFanSpeedH.text,  rbFanSpeedH.text])
                  rbFanSpeedM.font.bold = win.getBold([ rbFanSpeedM.text,  rbFanSpeedH.text])
                  rbFanSpeedL.font.bold = win.getBold([ rbFanSpeedL.text,  rbFanSpeedH.text])
             }
         }

         RadioButton {
             id: rbFanSpeedM
             x: 309
             y: 161
             text: qsTr("Medium")
             onToggled: {
                  rbFanSpeedH.font.bold = win.getBold([ rbFanSpeedH.text,  rbFanSpeedM.text])
                  rbFanSpeedM.font.bold = win.getBold([ rbFanSpeedM.text,  rbFanSpeedM.text])
                  rbFanSpeedL.font.bold = win.getBold([ rbFanSpeedL.text,  rbFanSpeedM.text])
             }
         }

         RadioButton {
             id: rbFanSpeedL
             x: 405
             y: 161
             text: qsTr("Low")
             onToggled: {
                  rbFanSpeedH.font.bold = win.getBold([ rbFanSpeedH.text,  rbFanSpeedL.text])
                  rbFanSpeedM.font.bold = win.getBold([ rbFanSpeedM.text,  rbFanSpeedL.text])
                  rbFanSpeedL.font.bold = win.getBold([ rbFanSpeedL.text,  rbFanSpeedL.text])
             }
         }


         Text {
             id: text9
             x: 211
             y: 136
             width: 149
             height: 44
             color: "#003603"
             text: qsTr("Fan Speed")
             font.pixelSize: 15
         }

         Slider {
             id: slider2
             x: 504
             y: 166
             value: 0.80
         }

         Text {
             id: text10
             x: 504
             y: 141
             width: 212
             height: 31
             color: "#003603"
             text: qsTr("Mass Flow Controller Setpoint:")
             font.pixelSize: 15
         }

         Text {
             id: text11
             x: 710
             y: 142
             width: 60
             height: 31
             text: qsTr(" 1 L/min")
             font.pixelSize: 13
         }


                    Text {
                        id: text13
                        x: 203
                        y: 53
                        width: 149
                        height: 44
                        color: "#003603"
                        text: qsTr(" Light Cycle Length")
                        font.pixelSize: 15
                    }



                Slider {
                    id: sChillerSetpoint
                    x: 123
                    y: 260
                    value: 0.5
                    onValueChanged: {
                        tChillerSetpoint.text = win.getValueChillerTemp(sChillerSetpoint.value)
                    }
                }

                Text {
                    id: tChillerTitle
                    x: 123
                    y: 235
                    width: 212
                    height: 31
                    color: "#003603"
                    text: qsTr("Chiller Setpoint:")
                    font.pixelSize: 15
                }

                Slider {
                    id: sHeaterSetpoint
                    x: 420
                    y: 259
                    value: 0.5
                    onValueChanged: {
                        tHeaterSetpoint.text = win.getValueHeaterTemp(sHeaterSetpoint.value)
                    }
                }

                Text {
                    id: tHeaterTitle
                    x: 420
                    y: 234
                    width: 212
                    height: 31
                    color: "#003603"
                    text: qsTr("Heater Setpoint:")
                    font.pixelSize: 15
                }

                Text {
                    id: tHeaterSetpoint
                    x: 547
                    y: 236
                    width: 60
                    height: 31
                    text: qsTr("100 C")
                    font.pixelSize: 13
                }

                Text {
                    id: tChillerSetpoint
                    x: 235
                    y: 237
                    width: 60
                    height: 31
                    text: qsTr("2 C")
                    font.pixelSize: 13
                }

        }
         Window {
             id: mainSequence
             width: 800
             height: 400
             visible: false
             property bool isClose3: false

             Text {
                 id: tMSHeader
                 text: qsTr("Main Test Sequence")
                 font.pixelSize: 40
             }
         }


}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}
}
##^##*/
