#include <QApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.addImportPath(":/Imports");
    engine.load(QUrl(QLatin1String("qrc:Qml/main.qml")));

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}



