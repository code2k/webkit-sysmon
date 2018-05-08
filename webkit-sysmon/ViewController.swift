//
// Copyright (c) 2018, CODE2K:LABS <https://code2k.net>
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.
//

import Cocoa
import WebKit

class ViewController: NSViewController {

    var webView: WKWebView!
    var jsBridge: JSBridge!

    override func viewDidLoad() {
        super.viewDidLoad()

        let configuration = WKWebViewConfiguration()
        let controller = WKUserContentController()

        configuration.userContentController = controller

        webView = WKWebView(frame: view.frame, configuration: configuration)
        jsBridge = JSBridge(controller, webView: webView)

        webView.autoresizingMask = [.height, .width]
        view.addSubview(webView)

        #if DEBUG
        let url = URL(string: "http://localhost:3000")!
        #else
        let url = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "build")!
        #endif
        webView.load(URLRequest(url: url))
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

}
