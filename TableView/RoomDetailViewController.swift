//
//  RoomDetailViewController.swift
//  TableView
//
//  Created by Hemanth Reddy on 8/4/15.
//  Copyright (c) 2015 xenovus. All rights reserved.
//

import UIKit

import RealmSwift

class RoomDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var roomIdLabel: UILabel!
    @IBOutlet weak var roomNameLabel: UILabel!
    @IBOutlet weak var relationshipLabel: UILabel!
    
    @IBOutlet weak var participantsTableView: UITableView!
    @IBOutlet weak var followersTableView: UITableView!
    
    var room: Room?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        self.roomIdLabel.text = self.room!.roomId
        self.roomNameLabel.text = self.room!.roomName
        
        if let rel = self.room!.relationship {
            self.relationshipLabel.text = rel.customers
        }
        
//        self.participantsTableView.rowHeight = UITableViewAutomaticDimension
//        self.participantsTableView.estimatedRowHeight = 35
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let persons = self.getPersonsForTableView(tableView) {
            return persons.count
        }
        return 0
    }
    
    func getPersonsForTableView(tableView: UITableView) -> List<Person>? {
        if tableView == self.participantsTableView {
            return self.room!.participants
            
        } else if tableView == self.followersTableView {
            
            return self.room!.followers
        }
        return nil
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let persons = self.getPersonsForTableView(tableView) {
            
            let p = persons[indexPath.row]
            
            if p.isOodly() {
                let cell = self.participantsTableView.dequeueReusableCellWithIdentifier("ParticipantOodlyCell", forIndexPath: indexPath) as! UITableViewCell
                
                if let nameLabel = cell.viewWithTag(101) as? UILabel {
                    nameLabel.text = p.firstName
                }
                
                if let phoneNoLabel = cell.viewWithTag(102) as? UILabel {
                    phoneNoLabel.text = p.phoneNo
                }
                
                return cell
                
            } else {
                
                let cell = self.participantsTableView.dequeueReusableCellWithIdentifier("ParticipantNonOodlyCell", forIndexPath: indexPath) as! UITableViewCell
                
                if let emailIdLabel = cell.viewWithTag(101) as? UILabel {
                    emailIdLabel.text = p.emailId
                }
                
                return cell
            }
        }
        
        return UITableViewCell()
    }
}
