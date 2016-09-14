//
//  ArticleViewController.swift
//  PocketDoc-Airlink
//
//  Created by HotRod on 6/16/16.
//  Copyright © 2016 Rod. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController, UIWebViewDelegate {
    var articlePDF = String()
    @IBOutlet weak var pdfWebView: UIWebView!
        
    @IBOutlet weak var loadIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        loadPDF()
    }
    func loadPDF(){
    if let pdf = NSBundle.mainBundle().URLForResource(articlePDF, withExtension: "pdf", subdirectory: nil, localization: nil)  {
        let req = NSURLRequest(URL: pdf)
        //let webView = UIWebView(frame: CGRectMake(20,20,self.view.frame.size.width-40,self.view.frame.size.height-40))
        //webView.loadRequest(req)
        //self.view.addSubview(webView)
        self.pdfWebView.loadRequest(req)
    }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func webViewDidStartLoad(webView: UIWebView){
        loadIndicator.hidden = false
        loadIndicator.startAnimating()
        print("Webview started Loading", terminator: "")
    }
    func webViewDidFinishLoad(webView: UIWebView){
        loadIndicator.hidden = true
        loadIndicator.stopAnimating()
        print("Webview stopped Loading", terminator: "")
        
    }


   
}
