//
//  JSBridge.swift
//  webkit-sysmon
//
//  Created by Andreas Pataki on 06.05.18.
//  Copyright © 2018 CODE2K:LABS. All rights reserved.
//

import Foundation
import WebKit

class JSBridge: NSObject, WKScriptMessageHandler {

    let webView: WKWebView

    init(_ userContentController: WKUserContentController, webView: WKWebView) {
        self.webView = webView
        super.init()
        userContentController.add(self, name: "refresh")
    }

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        switch message.name {
        case "refresh":
            handleRefresh()
        default:
            fatalError("Unknown JSBrigde message \(message.name)")
        }
    }

    var counter = 0

    private func handleRefresh() {
        print("refresh")
        counter += 1
        webView.evaluateJavaScript("window.pushData({value: \"\(counter)\"});", completionHandler: nil)

    }

}
