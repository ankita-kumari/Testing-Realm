//
//  RelationsViewController.swift
//  TableView
//
//  Created by Hemanth Reddy on 8/4/15.
//  Copyright (c) 2015 xenovus. All rights reserved.
//

import UIKit

import RealmSwift

class RelationsViewController: UITableViewController {

    private var relations: Results<Relationship>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.relations = getDefaultRealm().objects(Relationship)
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.relations != nil {
            NSLog("count %d", self.relations!.count)
            return self.relations!.count
        }
        return 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("RelationCell", forIndexPath: indexPath) as! UITableViewCell

        if let relationLabel = cell.viewWithTag(101) as? UILabel {
            if let relations = self.relations {
                relationLabel.text = relations[indexPath.row].customers
            }
        }

        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let id = segue.identifier {
            if id == "RoomsSegue" {
                if let index = self.tableView.indexPathForSelectedRow() {
                    
                    let vc = segue.destinationViewController as! RoomsViewController
                    
                    vc.relation = self.relations![index.row]
                }
            }
        }
    }
    
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        
//        if let relations = self.relations {
//            
//            let relation = relations[indexPath.row]
//            
//            
//            
//        }
//    }
}
