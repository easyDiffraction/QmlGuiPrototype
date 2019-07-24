#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtWebEngine>
//#include <QQuickStyle>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);
    app.setOrganizationName("ESS");
    app.setOrganizationDomain("esss.se");
    app.setApplicationName("easyDiffraction");

    QtWebEngine::initialize();
    //QQuickStyle::setStyle(QStringLiteral("Material"));

    QQmlApplicationEngine engine;
    engine.addImportPath("qrc:Qml/Imports");
    engine.load(QUrl(QStringLiteral("qrc:Qml/main.qml")));

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}



