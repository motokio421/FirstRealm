//
//  ViewController.swift
//  FirstRealm
//
//  Created by 比嘉幹樹 on 2019/07/30.
//  Copyright © 2019 比嘉幹樹. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var textFiled: UITextField!
    
   
    var items: [Item] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
//        RealmからItemを全体取得する
        let realm = try! Realm()
        items = realm.objects(Item.self).reversed()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }

    @IBAction func didclickbutton(_ sender: Any) {
//        新しいItemクラスのインスタンスを作成
        let item = Item()
        
//        Itemクラスに入力されたタイトルを設定
        item.title = textFiled.text
        
//        Realm 保存(記憶）
        let realm = try! Realm()
        try! realm.write {
            realm.add(item)
        }
        
//        最新のitem一覧を取得する
         items = realm.objects(Item.self).reversed()
        
//        テーブルを更新
        tableView.reloadData()
        
// テキストフィールを空にする
        textFiled.text = ""
        
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
//        表示するItemクラスを取得
        let item = items[indexPath.row]
        
//        セルのラベルに、Itemクラスのタイトルを取得
        cell.textLabel?.text = item.title
        
        return cell
        
    }
    
}
