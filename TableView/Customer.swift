//
//  Relation.swift
//  TableView
//
//  Created by Hemanth Reddy on 8/3/15.
//  Copyright (c) 2015 xenovus. All rights reserved.
//

import RealmSwift

class Customer: Object {
    
    dynamic var customer = ""
    
    override var hash: Int {
        return self.customer.hashValue
    }
    
    override func isEqual(object: AnyObject?) -> Bool {
        if self === object {
            return true
        }
        if let othr = object as? Customer {
            return self.customer == othr.customer
        }
        
        return false
    }
    
    override static func primaryKey() -> String? {
        return "customer"
    }
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}
