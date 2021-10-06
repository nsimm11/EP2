import sys
from os.path import abspath, dirname, join

from PySide2.QtCore import QObject, Slot
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine

class MyWindow(QObject):

    @Slot(str, result=str)
    def getValue(self, s):
        val = int(float(s) * 100)
        if val <= 0:
            return (str(0) + " Hours")
        else:
            return (str(val) + " Hours")

    @Slot(list, result=bool)
    def getBold(self, s):
        if s[0] == s[1]:
            print(s[1])
            return True
        else:
            return False

    @Slot(str, result=str)
    def getOF(self, s):
        if s == "OFF":
            print("ON")
            return "ON"
        else:
            print("OFF")
            return "OFF"

    @Slot(str, result=str)
    def getSubmit(self, s):
        print(s)
        return "SUBMIT"

    @Slot(list, result=bool)
    def getSubmitField(self, lst):
        if(lst[0] == "tfBatchID"):
            print("Batch ID: " + str(lst[1]))
        elif(lst[0] == "tfDate"):
            print("Date: " + str(lst[1]))
        elif(lst[0] == "tfNotes"):
            print("Notes: " + str(lst[1]))
        else:
            print("failed")
            return False
        return True

    @Slot(str, result=str)
    def getValueWaveLength(self, s):
        val = int(float(s) * 300 ) + 400
        if val <= 400:
            print(val)
            return (str(400) + " nm")
        else:
            print(val)
            return (str(val) + " nm")

    @Slot(str, result=str)
    def getValueChillerTemp(self, s):
        val = int(float(s) * 30 ) + -5
        if val <= -5:
            print(val)
            return (str(-5) + " C")
        else:
            print(val)
            return (str(val) + " C")

    @Slot(str, result=str)
    def getValueHeaterTemp(self, s):
        val = int(float(s) * 100 ) + 20
        if val <= 20:
            print(val)
            return (str(30) + " C")
        else:
            print(val)
            return (str(val) + " C")


if __name__ == '__main__':
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    # Instance of the Python object
    win = MyWindow()

    # Expose the Python object to QML
    context = engine.rootContext()
    context.setContextProperty("win", win)

    # Get the path of the current directory, and then add the name
    # of the QML file, to load it.
    qmlFile = join(dirname(__file__), 'main.qml')
    engine.load(abspath(qmlFile))

    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec_())
