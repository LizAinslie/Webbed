#include "UuidGenerator.h"

#include <QUuid>

UuidGenerator::UuidGenerator(QObject* parent) : QObject(parent) {}

Q_INVOKABLE QString UuidGenerator::nextId() {
    return QUuid::createUuid().toString();
}
    
