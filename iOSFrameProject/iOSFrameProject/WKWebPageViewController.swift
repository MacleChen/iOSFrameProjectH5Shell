//
//  WebPageViewController.swift
//  ECOCityProject
//
//  Created by jointsky on 2017/10/9.
//  Copyright © 2017年 陈帆. All rights reserved.
//

import UIKit
import WebKit

class WKWebPageViewController: UIViewController, WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler {
    
    
    var localPageUrlFilePath: String?   // 本地html的路径地址
    var pageUrlStr: String?         // 页面URL
    var pageThumbImageUrl: String?  // 分享宣传图片URL
    var isUserGesture: Bool?        // 是否具有捏合收拾
    var isShowShareBtn: Bool?       // 是否显示分享
    
    var isYearReportShare: Bool?    // 是否是年报分享
    
    var isAdaptNavigationHeight: Bool?  // 是否适配导航栏高度影响
    
    /// webView
    fileprivate lazy var webView: WKWebView  = {
        // 创建webveiew
        // 创建一个webiview的配置项
        let configuretion = WKWebViewConfiguration()
        
        // Webview的偏好设置
        configuretion.preferences = WKPreferences()
        
        // ************   解决不能加载微信公众号文章在iOS11.0设备上的问题  ************ //
        configuretion.preferences.minimumFontSize = 0
        
        configuretion.preferences.javaScriptEnabled = true
        
        // 默认是不能通过JS自动打开窗口的，必须通过用户交互才能打开
        configuretion.preferences.javaScriptCanOpenWindowsAutomatically = false
        
        // 通过js与webview内容交互配置
        configuretion.userContentController = WKUserContentController()
        
        // 添加一个名称，就可以在JS通过这个名称发送消息：
        // window.webkit.messageHandlers.iOS.postMessage({body: 'xxx'})
        configuretion.userContentController.add(self, name: "iOS")
        
        let webViewTemp = WKWebView.init(frame: CGRect.init(x: 0, y: STATUS_BAR_HEIGHT, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-STATUS_BAR_HEIGHT), configuration: configuretion)
        
        webViewTemp.uiDelegate = self
        webViewTemp.navigationDelegate = self
        
        // 是否适配导航栏高度影响
        if self.isAdaptNavigationHeight != nil && self.isAdaptNavigationHeight! {
            webViewTemp.frame.size.height = SCREEN_HEIGHT - NAVIGATION_AND_STATUS_HEIGHT
        }
        
        // 去掉底部黑条
        webViewTemp.isOpaque = false
        webViewTemp.backgroundColor = UIColor.clear
        
        // 是否添加捏合收拾
        if self.isUserGesture != nil && self.isUserGesture! {
            webViewTemp.autoresizingMask = (UIViewAutoresizing(rawValue: UIViewAutoresizing.RawValue(UInt8(UIViewAutoresizing.flexibleWidth.rawValue) | UInt8(UIViewAutoresizing.flexibleHeight.rawValue))))
            webViewTemp.allowsBackForwardNavigationGestures = true
            webViewTemp.isMultipleTouchEnabled = true
            //内容自适应
            webViewTemp.sizeToFit();
            webViewTemp.isUserInteractionEnabled = true
        }
        
        self.view.addSubview(webViewTemp)
        return webViewTemp
    }()
    
    
    // MARK: activityView
    fileprivate lazy var activityView: UIActivityIndicatorView = {
        let activityViewTemp = UIActivityIndicatorView.init(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        
        activityViewTemp.center = self.view.center
        activityViewTemp.isHidden = true
        
        return activityViewTemp
    }()
    
    
    // MARK: ProgressView
    fileprivate lazy var progressView: UIProgressView = {
        let progressViewTemp = UIProgressView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 3))
        progressViewTemp.trackTintColor = UIColor.clear
        progressViewTemp.progressTintColor = UIColorFromRGB(rgbValue: 0x52afad)
        progressViewTemp.transform = CGAffineTransform(scaleX: 1.0, y: 1.5)
        
        return progressViewTemp
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        self.setViewUI()
    }
    
    // MARK: leftBarBtnItem Click
    func leftBarBtnItemClick(sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: rightBarBtnItem Click
    func rightBarBtnItemClick(sender: UIBarButtonItem) {
        // 第三方分享
        // 分享
    }
    
    
    // MARK: - UIWebViewDelegate 方法的实现
    // MARK: did start load
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        //开始加载网页时展示出progressView
        self.progressView.isHidden = false
        //开始加载网页的时候将progressView的Height恢复为1.5倍
        self.progressView.transform = CGAffineTransform(scaleX: 1.0, y: 1.5)
        //防止progressView被网页挡住
        self.view.bringSubview(toFront: self.progressView)
    }
    
    // MARK: did finish load
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        //        self.webProgressLayer.finishedLoadWithError(nil)
        if self.title == nil {
            self.title = self.webView.title
        }
        
        self.activityView.isHidden = true
        self.activityView.stopAnimating()
        
        
        //加载完成后隐藏progressView
        //self.progressView.hidden = YES;
        
        // 检验是否是否返回（pop/back）
        self.checkGoBack()
        
        // 禁止放大缩小
        if self.isUserGesture == nil || !self.isUserGesture! {
            let injectionJSString = "var script = document.createElement('meta');"
                + "script.name = 'viewport';"
                + "script.content=\"width=device-width, initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0, user-scalable=no\";"
                + "document.getElementsByTagName('head')[0].appendChild(script);";
            webView.evaluateJavaScript(injectionJSString, completionHandler: nil)
        }
    }
    
    
    // MARK:  did finish error
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.activityView.isHidden = true
        self.activityView.stopAnimating()
        //        self.webProgressLayer.finishedLoadWithError(error)
        
        //加载失败同样需要隐藏progressView
        //self.progressView.hidden = YES;
        
        // 检验是否是否返回（pop/back）
        self.checkGoBack()
    }
    
    // MARK:didReceive 
    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge,
                 completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        let cred = URLCredential.init(trust: challenge.protectionSpace.serverTrust!)
        completionHandler(.useCredential, cred)
    }
    
    
    // MARK: 服务器请求跳转的时候调用
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        return true
    }
    
    // MARK: js响应回调
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        myPrint(message: "body =\(message.body), name=\(message.name)")
        let bodyStr = message.body as! String
        if (bodyStr == "SystemDeviceInformation") {
            let alert = UIAlertController.init(title: "提示", message: "请求：SystemDeviceInformation", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction.init(title: "取消", style: UIAlertActionStyle.cancel, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 析构方法 （回收垃圾）
    deinit {
        self.webView.removeObserver(self, forKeyPath: "estimatedProgress")
    }
    
    
    // MARK: view will disappear
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
}

extension WKWebPageViewController {
    func setViewUI() {
        // 设置 webView
        let request: URLRequest?
//        self.pageUrlStr = REQUEST_URL_INIT
        self.localPageUrlFilePath = Bundle.main.path(forResource: "testButton.html", ofType: nil)
        if self.localPageUrlFilePath == nil {
            // 加载网页
            request = URLRequest.init(url: URL.init(string: self.pageUrlStr!)!)
            
        } else {
            // 加载本地文件
            request = URLRequest.init(url: URL.init(fileURLWithPath: self.localPageUrlFilePath!))
        }
        
        self.webView.load(request!)
        
        
        // 设置加载圈
        self.view.addSubview(self.activityView)
        self.activityView.isHidden = false
        self.activityView.startAnimating()
        
        
        // 添加加载进度条
        self.view.addSubview(self.progressView)
        // 添加KVO进度加载方法
        self.webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
    }
    
    
    @objc func goBack(){
        self.webView.goBack()
    }
    
    
    /// 检查返回（pop/goback）
    func checkGoBack(){
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = !self.webView.canGoBack
        if self.webView.canGoBack{
        }else{
           
        }
    }
    
    
    // MARK: 在监听方法中获取网页加载的进度，并将进度赋给progressView.progress
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            self.progressView.progress = Float(self.webView.estimatedProgress)
            if self.progressView.progress == 1 {
                /*
                 *添加一个简单的动画，将progressView的Height变为1.4倍，在开始加载网页的代理中会恢复为1.5倍
                 *动画时长0.25s，延时0.3s后开始动画
                 *动画结束后将progressView隐藏
                 */
                UIView.animate(withDuration: 0.25, delay: 0.3, options: .curveEaseOut, animations: {
                    self.progressView.transform = CGAffineTransform(scaleX: 1.0, y: 1.4)
                }, completion: { (isFinish) in
                    self.progressView.isHidden = true
                })
            }
        } else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
}


