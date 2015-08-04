//
//  AppDelegate.swift
//  TableView
//
//  Created by Hemanth Reddy on 7/15/15.
//  Copyright © 2015 xenovus. All rights reserved.
//

import UIKit
import RealmSwift
//import Realm

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    

        
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        NSLog("migration database")
        
        
        setSchemaVersion(1, Realm.defaultPath, { migration, oldSchemaVersion in
//            if oldSchemaVersion < 1 {
//                // The enumerate(_:_:) method iterates
//                // over every Person object stored in the Realm file
//                migration.enumerate(ContactDB.className()) { oldObject, newObject in
//                    // combine name fields into a single field
//                    
//                    //newObject!["age"] = ""
//                }
//            }
//            
//            if oldSchemaVersion < 6 {
//                
//                migration.enumerate(ContactDB.className()) { oldObject, newObject in
//                    
//                    let d = newObject!["relation"] as! List<DynamicObject>
//                    
//                    let lst = List<Relation>()
//                    
//                    for r in d {
//                        
//                        let s = r["relation"] as! String
//                        
//                        var found = false
//                        
//                        for l in lst {
//                            if l.relation == s {
//                                found = true
//                                break
//                            }
//                        }
//                        
//                        if !found {
//                            lst.append(Relation(value: ["relation": s]))
//                        } else {
//                            NSLog("found-> %@", s)
//                        }
//                    }
//                    
//                    newObject!["relation"] = lst
//                }
//            }
        })

        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

