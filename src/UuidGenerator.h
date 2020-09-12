#pragma once

#include <QObject>
#include <QString>

class UuidGenerator : public QObject {
    Q_OBJECT
public:
    explicit UuidGenerator(QObject* parent = nullptr);
    
    Q_INVOKABLE static QString nextId();
};
