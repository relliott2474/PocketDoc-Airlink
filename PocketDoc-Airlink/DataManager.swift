//
//  DataManager.swift
//  SCMC ICU meds
//
//  Created by Rod Elliott-Mullens on 1/25/16.
//  Copyright © 2016 Rod Elliott-Mullens. All rights reserved.

import Foundation
import UIKit
import CoreData

class DataManager {
    
    let appDel = UIApplication.shared.delegate as! AppDelegate
    
    func saveNewDataToModel(_ nameText:String, dataText:String){
        if #available(iOS 10.0, *) {
            let context = appDel.persistentContainer.viewContext
            let newData = NSEntityDescription.insertNewObject(forEntityName: "NoteFile", into: context)
            // sets the new transferred data to be saved.
            //if nameText != newData.value(forKey: "noteTitle") as! String{
                let dateV = getCurrentShortDate()
                newData.setValue(dateV, forKey: "noteDate")
                newData.setValue(nameText, forKey: "noteTitle")
                newData.setValue(dataText, forKey: "noteText")
                
                
                do{
                    try context.save()
                    if let name = newData.value(forKey: "noteTitle"){
                        if let text = newData.value(forKey: "noteText"){
                            print(name, text)
                        }
                    }
                }catch{
                    print("failed to save data")
                }
            
        //} if nameText
        } else {
            // Fallback on earlier versions
        /*
         let context = iOS9DataManager().managedObjectContext
        let newData = NSEntityDescription.insertNewObject(forEntityName: "NoteFile", into: context)
        // sets the new transferred data to be saved.
        if nameText != newData.value(forKey: "noteTitle") as! String{
            let dateV = getCurrentShortDate()
            newData.setValue(dateV, forKey: "noteDate")
            newData.setValue(nameText, forKey: "noteTitle")
            newData.setValue(dataText, forKey: "noteText")
            

        do{
            try context.save()
            if let name = newData.value(forKey: "noteTitle"){
                if let text = newData.value(forKey: "noteText"){
                    print(name, text)
                }
            }
            }catch{
                print("failed to save data")
            }
         }*/
        }//else statement
    }
    
    /*func removeData(nameText:String){
        let context:NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "NoteFile")
        request.predicate = NSPredicate(format: "noteTitle = %@", nameText)
        request.returnsObjectsAsFaults = false
        
        do{
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                for result in results as! [NSManagedObject]{
                    context.deleteObject(result)
                    do{
                        try context.save()
                        print("data removed")
                        print(context)
                    }catch{
                        print("no data removed")
                    }
                }
            }
        }catch{
            print("unable to complete fetch request")
        }
        }*/
    
    func updateData (_ title:String, nameText:String, dataText:String){
        
        if #available(iOS 10.0, *) {
            let context:NSManagedObjectContext = appDel.persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "NoteFile")
            request.predicate = NSPredicate(format: "noteTitle = %@", title)
            //request.predicate = NSPredicate(format: "noteTitle = %@", nameText)  // this will help to search.
            request.returnsObjectsAsFaults = false
            
            do{
                let results = try context.fetch(request)
                if results.count > 0{
                    for result in results as! [NSManagedObject]{
                        result.setValue(nameText,forKey:"noteTitle")
                        result.setValue(dataText, forKey:"noteText")
                        do{
                            try context.save()
                            print("saved updated data")
                            if let newtitle = result.value(forKey: "noteTitle") as? String{
                                if let newdocument = result.value (forKey: "noteText") as? String{
                                    print("new data \(newtitle,newdocument)")
                                }
                            }
                        }catch {
                            print("failed to save updata data")
                        }
                    }
                }
                
            }//do
            catch{
                print("failed to update the data")
            }

        } else {
            // Fallback on earlier versions
        }
    }
    
    
    func getCurrentShortDate() -> String {
        let todaysDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let DateInFormat = dateFormatter.string(from: todaysDate)
        return DateInFormat
    }
}
