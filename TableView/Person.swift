//
//  Person.swift
//  TableView
//
//  Created by Hemanth Reddy on 8/4/15.
//  Copyright (c) 2015 xenovus. All rights reserved.
//

import RealmSwift

class Person: Object {
    
    dynamic var phoneNo = ""
    dynamic var emailAccounts = List<StringObject>()
    dynamic var emailId = ""
    dynamic var firstName = ""
    
    dynamic var _personId: String = "Hi"
    
    internal(set) var personId: String {
        get {
            if count(self.phoneNo) > 0 {
                return self.phoneNo
            } else if count(self.emailId) > 0 {
                return self.emailId
            } else {
                return self._personId
            }
        }
        set {
            self._personId = newValue
        }
    }
    
    func isOodly() -> Bool {
        if count(self.phoneNo) > 0 {
            return true
        }
        return false
    }
    
    override static func primaryKey() -> String? {
        return "personId"
    }
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}
