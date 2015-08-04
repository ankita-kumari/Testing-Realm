//
//  AddContactViewController.swift
//  TableView
//
//  Created by Hemanth Reddy on 7/17/15.
//  Copyright © 2015 xenovus. All rights reserved.
//

import UIKit
import RealmSwift
//import Realm

class AddContactViewController: UITableViewController {

    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var numberText: UITextField!
    
    
    @IBAction func cancelAddingContact(sender: UIButton) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    
    @IBAction func saveContact(sender: UIButton) {
        
        let realm = Realm()
        //realm.beginWriteTransaction()
        
        //let newContact = PersonDetails(firstName: "", lastName: "", number: "")
        let newContact = ContactDB()
        newContact.firstName = self.firstNameText.text!
        newContact.lastName = self.lastNameText.text!
        newContact.number = self.numberText.text!
        
        realm.write{
            realm.add(newContact)
        }
        //realm.commitWriteTransaction()
        
        //personsData.append(PersonDetails(firstName: self.firstNameText.text!, lastName: self.lastNameText.text!, number: self.numberText.text!))
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    var contactDetails: PersonDetails!
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            firstNameText.becomeFirstResponder()
        }
        if indexPath.section == 1 {
            lastNameText.becomeFirstResponder()
        }
        if indexPath.section == 2 {
            numberText.becomeFirstResponder()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "SavePlayerDetail" {
//            contactDetails = PersonDetails(firstName: self.firstNameText.text!, lastName: self.lastNameText.text!, number: self.numberText.text!)
//        }
    }

    
    
    // MARK: - Table view data source
/*
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
*/
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
