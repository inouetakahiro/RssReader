//
//  BookmarkViewController.swift
//  RssReader
//
//  Created by 福田翔大 on 2016/10/06.
//  Copyright © 2016年 banana. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class BookumarkViewController: UITableViewController {
    
    var bookmarks: Results<Bookmark>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = self.editButtonItem
//        self.title = "TableView Test"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let realm = try! Realm()
        bookmarks = realm.objects(Bookmark.self).sorted(byProperty: "date", ascending: false)
        
        tableView.reloadData()
}
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookmarks?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookmarkViewCell", for: indexPath)
        guard let bm = bookmarks?[indexPath.row] else {
            return cell
        }
        cell.textLabel?.text = bm.title
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = self.tableView.indexPathForSelectedRow {
            guard let bm = bookmarks?[indexPath.row] else {
                return
            }
            let item = Item()
            item.link = bm.link
            item.title = bm.title
            item.detail = bm.detail
            
            let controller = segue.destination as! DetailViewController
            controller.item = item
        }
    
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            print("削除")
//            print(indexPath[1])
            
            let realm = try! Realm()
            try! realm.write {
//                realm.deleteAll()
                realm.delete((bookmarks?[indexPath[1]])!)
            }
            tableView.reloadData()
        }
    }
}
