import os, sys
from PySide2.QtCore import QUrl, Qt, QCoreApplication
from PySide2.QtWidgets import QApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtWebEngine import QtWebEngine

if __name__ == '__main__':
    QCoreApplication.setAttribute(Qt.AA_EnableHighDpiScaling)

    app = QApplication(sys.argv)
    app.setOrganizationName("ESS")
    app.setOrganizationDomain("esss.se")
    app.setApplicationName("easyDiffraction")

    QtWebEngine.initialize()

    engine = QQmlApplicationEngine()
    engine.addImportPath(os.path.join(os.path.dirname(sys.argv[0]), "..", "Qml", "Imports"))
    engine.load(QUrl.fromLocalFile(os.path.join(os.path.dirname(sys.argv[0]), "..", "Qml", "main.qml")))

    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec_())
