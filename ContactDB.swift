//
//  ContactDB.swift
//  TableView
//
//  Created by Hemanth Reddy on 7/22/15.
//  Copyright © 2015 xenovus. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
//import Realm

/*class ContactDB: Object {
    dynamic var firstName = ""
    dynamic var lastName = ""
    dynamic var number = ""
    
    override static func primaryKey() -> String? {
        return "number"
    }

    override static func indexedProperties() -> [String] {
        return ["number" ]
    }
   
}*/

class ContactDB: Object {
    
    dynamic var firstName = ""
    dynamic var lastName = ""
    dynamic var number = ""
    dynamic var email = ""
    dynamic var age = ""
    dynamic var gender = ""
    
    dynamic var relationship: Relationship?
    
    /*override static func primaryKey() -> String? {
        return "number"
    }*/
    
    override static func indexedProperties() -> [String] {
        return ["number"]
    }
    
//    override static func ignoreProperties() -> [String] {
//        return ["relationship"]
//    }
}



