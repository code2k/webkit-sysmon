//
// Copyright (c) 2018, CODE2K:LABS <https://code2k.net>
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.
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
