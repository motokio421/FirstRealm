//
//  Item.swift
//  FirstRealm
//
//  Created by 比嘉幹樹 on 2019/07/30.
//  Copyright © 2019 比嘉幹樹. All rights reserved.
//

import RealmSwift

// エクセルで「「item」というシートを作成するイメージ
class Item: Object {
    
//    タイトルを保存する列のイメージ
    @objc dynamic var title: String?
    
//    登録日数を保存する列のイメージ
    @objc dynamic var created = Data()
    
}
