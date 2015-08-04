//
//  Global.swift
//  TableView
//
//  Created by Hemanth Reddy on 8/4/15.
//  Copyright (c) 2015 xenovus. All rights reserved.
//

import Foundation
import RealmSwift

func getDefaultRealm() -> Realm {
    
    let threadLocal = NSThread.currentThread().threadDictionary
    
    if let defaultRealm = threadLocal["defaultRealm"] as? Realm {
        return defaultRealm
    }
    
    let defaultRealm = Realm()
    threadLocal["defaultRealm"] = defaultRealm
    
    return defaultRealm
}