#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include <QUrl>
#include <KLocalizedContext>

#include "UserAgent.h"
#include "UuidGenerator.h"

Q_DECL_EXPORT int main(int argc, char *argv[]) {
    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication app(argc, argv);
    QCoreApplication::setOrganizationName("RailDev");
    QCoreApplication::setOrganizationDomain("raildev.tech");
    QCoreApplication::setApplicationName("webbed");

    QQmlApplicationEngine engine;
    
    qmlRegisterSingletonType(QUrl("qrc:///browser_data.qml"), "tech.raildev.webbed.data", 1, 0, "BrowserData");
    qmlRegisterType<UserAgent>("tech.raildev.webbed", 1, 0, "UserAgentGenerator");
    qmlRegisterType<UuidGenerator>("tech.raildev.webbed.data", 1, 0, "UuidGeneratorBase");
    qmlRegisterSingletonType(QUrl("qrc:///uuid_generator.qml"), "tech.raildev.webbed.data", 1, 0, "UuidGenerator");

    engine.rootContext()->setContextObject(new KLocalizedContext(&engine));
    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));

    if (engine.rootObjects().isEmpty()) return -1;

    return app.exec();
}
