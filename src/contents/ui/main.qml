import QtQuick 2.7
import org.kde.kirigami 2.4 as Kirigami
import QtQuick.Controls 2.1 as Controls
import QtQuick.Layouts 1.3
import QtWebEngine 1.10

import tech.raildev.webbed.data 1.0
import "Functions.js" as Functions

Kirigami.ApplicationWindow {
    id: root

    title: i18n("Webbed")

    pageStack.initialPage: mainComponent
    
    Component {
        id: mainComponent
        
        
        ColumnLayout {
            RowLayout {
                Layout.preferredWidth: parent.width
                Layout.preferredHeight: Kirigami.Units.gridUnit * 2
                Layout.alignment: Qt.AlignTop
                
                Controls.TabBar {
                    id: tabs
                    Layout.preferredWidth: parent.width - Kirigami.Units.gridUnit * 2
                    
                    Repeater {
                        id: tabsRepeater
                        model: BrowserData.tabs
                        
                        Controls.TabButton {
                            text: modelData
                        }
                    }
                }
                
                Controls.ToolButton {
                    Layout.preferredWidth: Kirigami.Units.gridUnit * 1.5
                    Layout.preferredHeight: Kirigami.Units.gridUnit * 1.5
                    Layout.alignment: Qt.AlignRight
                    
                    icon.name: "document-new"
                    
                    Kirigami.Theme.inherit: true
                    
                    onClicked: BrowserData.createTab("https://google.com")
                }
            }
            
            Connections {
                target: BrowserData
                onTabCreated: {
                    tabsRepeater.model = BrowserData.tabs
                    pagesRepeater.model = BrowserData.tabs
                }
            }
            
            StackLayout {
                width: parent.width
                currentIndex: tabs.currentIndex
                
                Repeater {
                    id: pagesRepeater
                    model: BrowserData.tabs
                    
                    ColumnLayout {
                        width: parent.width
                        RowLayout {
                            Layout.alignment: Qt.AlignCenter
                            Layout.preferredHeight: Kirigami.Units.gridUnit * 2
                            Layout.preferredWidth: parent.width - Kirigami.Units.gridUnit
                            
                            Controls.TextField {
                                Layout.preferredWidth: parent.width - Kirigami.Units.gridUnit * 2.5
                                Layout.preferredHeight: Kirigami.Units.gridUnit * 1.5
                                id: urlInput
                                
                                onAccepted: applyUrl()
                                
                                Kirigami.Theme.inherit: true
                                
                                function applyUrl() {
                                    webView.url = text
                                }
                            }
                            
                            Controls.ToolButton {
                                Layout.preferredWidth: Kirigami.Units.gridUnit * 1.5
                                Layout.preferredHeight: Kirigami.Units.gridUnit * 1.5
                                Layout.alignment: Qt.AlignRight
                                
                                icon.name: "go-next"
                                
                                Kirigami.Theme.inherit: true
                                
                                onClicked: urlInput.applyUrl()
                            }
                        }
                        
                        WebEngineView {
                            id: webView
                            Layout.alignment: Qt.AlignBottom
                            Layout.fillHeight: true
                            Layout.preferredHeight: parent.height - Kirigami.Units.gridUnit * 2
                            Layout.preferredWidth: parent.width
                            url: modelData
                            
                            onUrlChanged: {
                                urlInput.text = url;
                                BrowserData.tabs[index] = url;
                                tabs.itemAt(index).text = Functions.truncateString(url.toString(), 37);
                            }
                            
                            onNewViewRequested: {
                                if (request.userInitiated) {
                                    BrowserData.createTab(request.requestedUrl.toString());
                                    showPassiveNotification(i18n("Website was opened in a new tab."));
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
