//
//  PeopleHelper.swift
//  chat
//
//  Created by Elvis Tapfumanei on 2017/04/03.
//  Copyright © 2017 Elvis Tapfumanei. All rights reserved.
//

import UIKit
import CoreData

extension PeopleController {

    
    func clearData() {
        
        let delegate = UIApplication.shared.delegate as? AppDelegate
        if let context = delegate?.persistentContainer.viewContext{
            
            do {
               
                let entityNames = ["Friend", "Message"]
                
                for entityName in entityNames {
                
                    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
                    
                  let  objects = try(context.fetch(fetchRequest)) as? [NSManagedObject]
                    
                    for object in objects! {
                        context.delete(object)
                    }
                }
                
                try(context.save())
                
                
            } catch let err {
                print(err)
            }
            
            
        }
        

    
    }
    
    
    func setupData() {
        
        clearData()
        let delegate = UIApplication.shared.delegate as? AppDelegate
        if let context = delegate?.persistentContainer.viewContext{
        
            let loki = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: context) as! Friend
            loki.name = "Tom Hiddleston"
            loki.profileImageName = "loki"
            
            let message = NSEntityDescription.insertNewObject(forEntityName: "Message", into: context) as! Message
            message.friend = loki
            message.text = "Hello, my name is Tom. Nice to meet you. Some like to call me, Loki though. :)"
            message.date = NSDate()
            
            
            let thor = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: context) as! Friend
            thor.name = "Chris Hemsworth"
            thor.profileImageName = "thor"
            
            let messageThor = NSEntityDescription.insertNewObject(forEntityName: "Message", into: context) as! Message
            messageThor.friend = thor
            messageThor.text = "Hey, I'm Chris. I am the guy who was Thor in the movie franchise Thor"
            messageThor.date = NSDate()
            
            do {
                try(context.save())
            } catch let err {
                print(err)
            }
            
        }
        
        loadData()
        
    }

    
    func loadData() {
       
        let delegate = UIApplication.shared.delegate as? AppDelegate
        if let context = delegate?.persistentContainer.viewContext{
        
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Message")
            
            do {
              messages = try(context.fetch(fetchRequest)) as? [Message]
            } catch let err {
                print(err)
            }
        
        
        }
        
    
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
