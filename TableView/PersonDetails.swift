//
//  PersonDetails.swift
//  TableView
//
//  Created by Hemanth Reddy on 7/17/15.
//  Copyright © 2015 xenovus. All rights reserved.
//

import Foundation
import UIKit

class PersonDetails: NSObject {
    var firstName: String
    var lastName: String
    //var pic: UIImage
    var number: String
    
    init(firstName: String, lastName: String,number: String){
        self.firstName = firstName
        self.lastName = lastName
        self.number = number
        super.init()
    }
}
