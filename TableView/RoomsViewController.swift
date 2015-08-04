//
//  RoomsViewController.swift
//  TableView
//
//  Created by Hemanth Reddy on 8/4/15.
//  Copyright (c) 2015 xenovus. All rights reserved.
//

import UIKit

import RealmSwift

class RoomsViewController: UITableViewController {

    var relation: Relationship?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let rel = self.relation {
            return rel.rooms.count
        }
        return 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("RoomCell", forIndexPath: indexPath) as! UITableViewCell
        
        if let roomLabel = cell.viewWithTag(101) as? UILabel {
            roomLabel.text = self.relation!.rooms[indexPath.row].roomName
        }

        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let id = segue.identifier {
            if id == "RoomDetailSegue" {
                let vc = segue.destinationViewController as? RoomDetailViewController
                if let index = self.tableView.indexPathForSelectedRow() {
                    vc!.room = self.relation!.rooms[index.row]
                }
            }
        }
        
    }
}
