pragma Singleton
import QtQuick 2.0

Item {
    property var tabs: ['https://google.com']
    property int currentTabIndex: 0
    
    function createTab(tabUrl) {
        tabs.push(tabUrl);
        tabCreated(tabUrl);
    }
    
    signal tabCreated
}
