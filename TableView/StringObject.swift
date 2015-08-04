//
//  StringObject.swift
//  TableView
//
//  Created by Hemanth Reddy on 8/4/15.
//  Copyright (c) 2015 xenovus. All rights reserved.
//

import RealmSwift

class StringObject: Object {
    
    dynamic var value: String = ""
    
    required init() {
        super.init()
    }
    
    init(string: String) {
        super.init()
        self.value = string
    }

//    override static func primaryKey() -> String? {
//        return "value"
//    }
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}
