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

    private func handleRefresh() {
        NSLog("refresh")
        let data = SystemHelper.getJSON()
        NSLog("\(data)")
        webView.evaluateJavaScript("window.pushData(\(data));", completionHandler: nil)

    }

}
