pragma Singleton
import QtQuick 2.0

import tech.raildev.webbed.data 1.0

Item {
    property var tabs: [{url: 'https://google.com', id: UuidGenerator.uuid()}]
    property int currentTabIndex: 0
    
    function createTab(tabUrl) {
        tabs.push({
            url: tabUrl,
            id: UuidGenerator.uuid()
        });
        tabCreated();
    }
    
    function closeTab(tabId) {
        tabs.splice(tabs.findIndex(function(tab) {return tab.id === tabId}), 1);
        tabClosed();
    }
    
    signal tabCreated
    signal tabClosed
}
