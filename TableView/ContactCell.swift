//
//  ContactCell.swift
//  TableView
//
//  Created by Hemanth Reddy on 7/17/15.
//  Copyright © 2015 xenovus. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var numberCell: UILabel!
    @IBOutlet weak var relationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
