//
//  ViewController.swift
//  webkit-sysmon
//
//  Created by Andreas Pataki on 06.05.18.
//  Copyright © 2018 CODE2K:LABS. All rights reserved.
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

        let url = URL(string: "http://localhost:3000")!
//        let url = Bundle.main.url(forResource: "index", withExtension: "html")!
        webView.load(URLRequest(url: url))
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

}
