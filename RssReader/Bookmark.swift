//
//  Bookmark.swift
//  RssReader
//
//  Created by 福田翔大 on 2016/10/06.
//  Copyright © 2016年 banana. All rights reserved.
//

import Foundation
import RealmSwift

class Bookmark: Object {
    dynamic var title = ""
    dynamic var detail = ""
    dynamic var link = ""
    dynamic var date: NSDate? = nil
}
