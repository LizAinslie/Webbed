#include "UserAgent.h"

#include <QtWebEngine/QQuickWebEngineProfile>
#include <QtWebEngine/QtWebEngineVersion>

UserAgent::UserAgent(QObject* parent): QObject(parent), _isMobile(true) {}

QString UserAgent::userAgent() {
    return QStringLiteral("Mozilla/5.0 (%1) AppleWebKit/537.36 (KHTML, like Gecko) QtWebEngine/%2 Chrome/75.0.3770.116 %3 Safari/537.36").arg(_isMobile ? QStringLiteral("Linux; Plasma Mobile, like Android 9.0") : QStringLiteral("X11; Linux x86_64"), QStringLiteral(QTWEBENGINE_VERSION_STR), _isMobile ? QStringLiteral("Mobile") : QStringLiteral("Desktop"));
}

bool UserAgent::isMobile() const {
    return _isMobile;
}

void UserAgent::setMobile(bool value) {
    if (_isMobile != value) {
        _isMobile = value;

        emit isMobileChanged();
        emit userAgentChanged();
    }
}
