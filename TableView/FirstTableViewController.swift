    //
//  ViewController.swift
//  TableView
//
//  Created by Hemanth Reddy on 7/15/15.
//  Copyright © 2015 xenovus. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift
//import Realm

class FirstTableViewController: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchActive: Bool = false
    
    var persons: Results<ContactDB>?
    
    let relations = ["xenovus", "ibmx", "citriks", "fordx", "gsoc", "fba", "yahoox", "googlex", "microsoftx", "fulex", "amazonx", "hydx", "flipkartx"]
    
    var addContactFlag = 0
   // var persons = realm.objects(ContactDB)
    
    
   // var filteredContacts = [ContactDB]()
    
    func getRandomRelation() -> List<Customer> {
        
        let lst = List<Customer>()
        
        let s = UInt32(self.relations.count)
        
        let counter = arc4random_uniform(s)
        
        let rltns = NSMutableArray(array: self.relations)
        
        for i in 0...counter {
        
            let index = Int(arc4random_uniform(UInt32(rltns.count)))
            
            let str = rltns[index] as! String
            
            lst.append(Customer(value: ["customer": str]))
            
            rltns.removeObjectAtIndex(index)
        }
        
        return lst
    }
   
    @IBAction func addContact(sender: AnyObject) {
        addContactFlag = 1
    }
    
    func addRandomPersons() {
        
        var a = Array<Int>()
        
        for i in 0...1000000 {
            a.append(i)
        }
        
        for i in 0...1000 {
            
            getDefaultRealm().beginWrite()
            
            for j in 0...1000 {
                
                let index = Int(arc4random_uniform(UInt32(a.count)))
                
                getDefaultRealm().add(ContactDB(value: ["number": index]), update: true)
                
                a.removeAtIndex(index)
            }
            
            getDefaultRealm().commitWrite()
        }
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchActive = true
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchActive = false
        
    }

    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        /*filteredContacts = persons.filter({ (person: ContactDB) -> Bool in
            let tmp  = person.firstName
            let range = tmp.rangeOfString(searchText)
            return range != nil
        })
        
        let predicate = NSPredicate(format: "name BEGINSWITH [c]%@", searchText)
        filteredContacts = persons.objectsWithPredicate(predicate).sortedResultsUsingProperty("firstName", ascending: true)
        if filteredContacts.count == 0 {
            searchActive = false
        }
        else {
            searchActive = true
        }
        self.tableView.reloadData()*/
        
    }
    /*
    func filterMethodForSearch(searchText: String){
        self.filteredContacts = self.persons.filter({(person: PersonDetails) -> Bool in
            //let firstNameMatch = (scope == "All") || (person.firstName == scope)
            let stringMatch = person.firstName.rangeOfString(searchText)
            print(stringMatch)
            return  (stringMatch != nil)
        })
    }
    
    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchString searchString: String!) -> Bool {
        self.filterMethodForSearch(searchString)
        return true
    }
    
    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchScope searchOption: Int) -> Bool {
        self.filterMethodForSearch(self.searchDisplayController!.searchBar.text!)
        return true
    }
    */
    
    func addRandomRelations() {
        var relationship: Relationship?
        
        let customers = "ibmx,citriks,fordx"
        
        relationship = getDefaultRealm().objectForPrimaryKey(Relationship.self, key: customers)
        
        if(relationship == nil) {
            relationship = Relationship()
            relationship!.customers = customers
        }
        
        let uuid = NSUUID()
        
        let r1 = Room(value: ["roomId": NSUUID().UUIDString, "roomName": "room3"])
        
        var p1 = Person()
        
        p1.firstName = "asdf"
        p1.phoneNo = "+919985531370"
        p1.emailAccounts.append(StringObject(string: "test@gmail.com"))
        p1.emailAccounts.append(StringObject(string: "asdf@gmail.com"))
        
        r1.participants.append(p1)
        
        p1 = Person()
        
        p1.emailId = "notyet@gmail.com"
        
        r1.participants.append(p1)
        
        let r2 = Room(value: ["roomId": NSUUID().UUIDString, "roomName": "room4"])
        
        r2.participants.append(p1)
        
        getDefaultRealm().write { () -> Void in
            
            relationship!.rooms.append(r1)
            relationship!.rooms.append(r2)
            
            getDefaultRealm().add(relationship!, update: true)
        }
        
        relationship = getDefaultRealm().objectForPrimaryKey(Relationship.self, key: customers)
        
        let r3 = Room(value: ["roomId": NSUUID().UUIDString, "roomName": "room5"])
        let r4 = Room(value: ["roomId": NSUUID().UUIDString, "roomName": "room6"])
        
        getDefaultRealm().write { () -> Void in
            
            relationship!.rooms.append(r3)
            relationship!.rooms.append(r4)
            
            getDefaultRealm().add(relationship!, update: true)
        }
    }
    
    override func viewDidLoad() {

//        NSFileManager.defaultManager().removeItemAtPath(Realm.defaultPath, error: nil)
        
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        addContactFlag = 0
        
//        NSFileManager.defaultManager().removeItemAtPath(Realm.defaultPath, error: nil)
        
        
        let relations = getDefaultRealm().objects(Relationship)
        
        
        
        
        
//        let results = getDefaultRealm().objects(ContactDB)
//        
//        for i in 0..<results.count {
//            
//            let startTxn = i%1000 == 0
//            
//            if startTxn {
//                
//                if getDefaultRealm().inWriteTransaction {
//                    getDefaultRealm().commitWrite()
//                }
//                
//                getDefaultRealm().beginWrite()
//            }
//            
//            let contact = results[i]
//            
//            
//            
////            contact.relation.extend(self.getRandomRelation())
//            
////            NSLog("contact-> %@", contact)
//            
//        }
//        
//        if getDefaultRealm().inWriteTransaction {
//            getDefaultRealm().commitWrite()
//        }
        
        
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
        
            let time = CFAbsoluteTimeGetCurrent()
        
            let persons = getDefaultRealm().objects(ContactDB).sorted("number", ascending: true)
        
            NSLog("time-> %f", (CFAbsoluteTimeGetCurrent() - time))
            
            if !persons.isEqual(self.persons) {
                
//                let ps = NSMutableArray()
//                
//                for p in persons {
//                    
//                    ps.addObject(ContactDB(value: p))
//                }
                
                self.persons = persons
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    
                    self.tableView.reloadData()
                })
            }
//        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if let persons = self.persons {
//            return persons.count
//        }
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let persons = self.persons {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as? ContactCell
            
            let contact = persons[indexPath.row]
            
            cell!.firstNameLabel.text = contact.firstName
            cell!.numberCell.text = contact.number
            
            cell!.relationLabel.text = ""//contact.relationship!.description
            
            return cell!
            
        }
        
        return UITableViewCell()
    }
    
    @IBAction func cancelToFirstTableViewController(segue:UIStoryboardSegue) {
        
    }
    
    @IBAction func saveContactDetail(segue:UIStoryboardSegue) {
        
        if let contactDetailsViewController = segue.sourceViewController as? AddContactViewController {
            
            personsData.append(contactDetailsViewController.contactDetails!)
            
            let indexPath = NSIndexPath(forRow: personsData.count - 1, inSection: 0)
            
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if addContactFlag == 1 {
            var destViewController = segue.destinationViewController as! AddContactViewController
        }
        else {
            var indexPath : NSIndexPath = self.tableView.indexPathForSelectedRow()!
        
        //var destViewController = segue.destinationViewController as SecondTableViewController
        var destViewController = segue.destinationViewController as! ContactDetailTableViewController
    
        //var secondTableArrayTwo: SecondTable
        //secondTableArrayTwo = secondArray[indexPath.row]
        
        destViewController.indexRow = indexPath.row
        }
    }

   /* func tableView(tableView: NSTableView, sortDescriptorsDidChange oldDescriptors: [AnyObject]!){
        
        for sortDescriptor in tableView.sortDescriptors.reverse() as [NSSortDescriptor] {
            firstTableArray.sort() { (item1, item2) in
                return sortDescriptor.compareObject(item1, toObject: item2) == NSComparisonResult.OrderedAscending
        }
        
    }*/
    
    
    
    
    
    
    
    
    
    
    
    

}

