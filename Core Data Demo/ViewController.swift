//
//  ViewController.swift
//  Core Data Demo
//
//  Created by Chatterjee, Snigdhaman on 10/01/16.
//  Copyright © 2016 Chatterjee, Snigdhaman. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.managedObjectContext
        
        /*var newUser = NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext: context)
        newUser.setValue("golgol", forKey: "userName")
        newUser.setValue("123", forKey: "password")
        
        do {
            
            try context.save()
            
        } catch {
            
            print("Go to")
            
        }*/
        
        let request = NSFetchRequest(entityName: "User")
        //request.predicate = NSPredicate(format: "userName = %@", "Snig")
        request.returnsObjectsAsFaults = false
        
        do {
            
            let result = try context.executeFetchRequest(request)
            
            if result.count > 0 {
                
                for row in result as! [NSManagedObject] {
                    
                    //context.deleteObject(row)
                    
                    //row.setValue("ralphie", forKey: "userName")
                    
                    do {
                        
                        try context.save()
                        
                    } catch {
                        
                        print("Error")
                        
                    }
                    
                    if let userName = row.valueForKey("userName") as? String {
                        
                        print(userName)
                        
                    }
                    
                }
                
            }
            
        } catch {
            
            print("No records found")
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

