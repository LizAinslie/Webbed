pragma Singleton

import QtQuick 2.0
import tech.raildev.webbed.data 1.0

Item {
    UuidGeneratorBase {
        id: baseUuid
    }
    
    function uuid() {
        return baseUuid.nextId();
    }
}
