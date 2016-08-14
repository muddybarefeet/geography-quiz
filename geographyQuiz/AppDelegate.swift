//
//  AppDelegate.swift
//  geographyQuiz
//
//  Created by Anna Rogers on 8/13/16.
//  Copyright © 2016 Anna Rogers. All rights reserved.
//

import UIKit
import SwiftyJSON

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    let landAreas = CoreDataStack(modelName: "Model")!
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        //resetData()
        //preloadData ()
        // Only want to load core data when the app first loads
        let defaults = NSUserDefaults.standardUserDefaults()
        let isPreloaded = defaults.boolForKey("dataPreloaded")
        if !isPreloaded {
            print("data not preloaded yet ...")
            preloadData()
            defaults.setBool(true, forKey: "dataPreloaded")
        } else {
            print("data is already loaded into core data")
        }
        landAreas.autoSave(60)
        return true
    }
    
    func preloadData () {
        //1. read the json file
        if let path = NSBundle.mainBundle().pathForResource("countries", ofType: "json") {
            do {
                let data = try NSData(contentsOfURL: NSURL(fileURLWithPath: path), options: NSDataReadingOptions.DataReadingMappedIfSafe)
                let jsonObj = JSON(data: data)
                if jsonObj != JSON.null {
                    //2. loop through the data and insert it into core data
                    var i = 0
                    while i < jsonObj.count {
                        _ = CountryModel(name: String(jsonObj[i]["country"]), continent: String(jsonObj[i]["continent"]), coordinates: String(jsonObj[i]["coordinates"]), coordType: String(jsonObj[i]["coordinates_type"]), context: landAreas.context)
                        i += 1
                    }
                } else {
                    print("could not get json from file, make sure that file contains valid json.")
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        } else {
            print("Invalid filename/path.")
        }
    }
    
    // DEVELOPMENT ONLY: helper function to remove all data from core data if needed
    private func resetData () {
        do{
            try landAreas.dropAllData()
        }catch{
            print("Error droping all objects in DB")
        }
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
        landAreas.save()
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        landAreas.save()
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

