import PlaygroundSupport
import WebKit
import Vapor
import Ccmark
@testable import App

let webView = WKWebView(frame: .init(x: 0, y: 0, width: 376, height: 750))

let app = try! Application.testable()

let postsResponse = try! app.sendRequest(to: "/posts")

let bodyContent = String(data: postsResponse.http.body.data!, encoding: .utf8)

webView.loadHTMLString(bodyContent!, baseURL: nil)
PlaygroundPage.current.liveView = webView
