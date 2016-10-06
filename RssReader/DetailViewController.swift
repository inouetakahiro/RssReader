//
//  DetailViewController.swift
//  RssReader
//
//  Created by 福田翔大 on 2016/10/04.
//  Copyright © 2016年 banana. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    var item: Item?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let i = item else {
            return
        }
        if let url = URL(string: i.link) {
            let request = URLRequest(url: url)
            webView.loadRequest(request)
        }
    }
}
