//
//  Room.swift
//  TableView
//
//  Created by Hemanth Reddy on 8/4/15.
//  Copyright (c) 2015 xenovus. All rights reserved.
//

import RealmSwift

class Room: Object {
    
    dynamic var roomId = ""
    dynamic var roomName = ""
    
    dynamic var relationship: Relationship? {
        
        let relations = linkingObjects(Relationship.self, forProperty: "rooms")
        
        if relations.count > 0 {
            return relations[0]
        }
        
        return nil
    }
    
    dynamic var participants = List<Person>()
    dynamic var followers = List<Person>()
    
    override static func primaryKey() -> String? {
        return "roomId"
    }
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}
