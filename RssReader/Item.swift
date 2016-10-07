//
//  Item.swift
//  RssReader
//
//  Created by 福田翔大 on 2016/10/04.
//  Copyright © 2016年 banana. All rights reserved.
//

import Foundation
import Ji

class Item {
    var title = ""
    var detail = ""
    var link = ""
    var imgUrl: URL?
    var jiDoc : Ji? = nil {
        didSet {
            if let img = jiDoc?.xPath("//img[@class='entry-image']")?.first {
                imgUrl = URL(string: img["src"]!)
            }else{
                imgUrl = nil
            }
        }
    }
}
