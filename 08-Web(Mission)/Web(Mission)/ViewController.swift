//
//  ViewController.swift
//  Web(Mission)
//
//  Created by 김건우 on 2023/02/23.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet var myWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        loadHtmlFile("htmlView")
    }
    
    func loadHtmlFile(_ html: String) {
        let filePath = Bundle.main.path(forResource: html, ofType: "html")
        let myUrl = URL(filePath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }
}

