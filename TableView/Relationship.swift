//
//  Relationship.swift
//  TableView
//
//  Created by Hemanth Reddy on 8/3/15.
//  Copyright (c) 2015 xenovus. All rights reserved.
//

import RealmSwift

class Relationship: Object {
    
    dynamic var customers:String = ""
    
    dynamic var rooms:List<Room> = List<Room>()
    
    override static func primaryKey() -> String? {
        return "customers"
    }
    
    override var description: String {
//        return reduce(self.customers, "", { (str, rel) -> String in
//            let maybeComma =  self.customers.last == rel ? "" : ", "
//            return "\(str)\(rel.customer)\(maybeComma)"
//        })
        return self.customers
    }
}
