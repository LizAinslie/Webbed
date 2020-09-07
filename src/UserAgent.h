#pragma once

#include <QObject>

class UserAgent : public QObject {
    Q_OBJECT
    Q_PROPERTY(QString userAgent READ userAgent NOTIFY userAgentChanged)
    Q_PROPERTY(bool isMobile READ isMobile WRITE setMobile NOTIFY isMobileChanged)

public:
    explicit UserAgent(QObject* parent = nullptr);
    
    QString userAgent();
    bool isMobile() const;
    void setMobile(bool value);
    
signals:
    void isMobileChanged();
    void userAgentChanged();
    
private:
    bool _isMobile;
};
