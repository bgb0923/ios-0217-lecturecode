//
//  CoreDataStack.swift
//  coreDataPartDeux
//
//  Created by Johann Kerr on 3/28/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import Foundation
import CoreData

final class CoreDataStack {
    static let store = CoreDataStack()
    fileprivate init() {}
    
    var persons = [Person]()
    
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
   func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "coreDataPartDeux")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    func createPerson(name: String, birthdate: Date, profPic: String) {
        let context = persistentContainer.viewContext
     
            let person = Person(context: context)
            person.name = name
            person.birthdate = birthdate as NSDate
            person.profpic = profPic
            saveContext()
    
        
    }
    
    
    func getAllVehicles(person: Person) -> [Vehicle]? {
        if let vehicles = person.vehicles?.allObjects as? [Vehicle] {
            return vehicles
        } else {
            return nil
        }
        
        
        
    }
    
    func getOwner(_ vehicle: Vehicle) -> Person? {
        if let person = vehicle.person {
            return person
        } else {
            return nil
        }
        
    }
    
    
    func addVehicle(_ vehicle:Vehicle, to person: Person) {
        person.addToVehicles(vehicle)
    }
    
    func addPerson(_ person:Person, to vehicle: Vehicle) {
        vehicle.person = person
      
    }
    
    
    
    func getAllPerson() {
        let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()
        
        do {
            let persons = try context.fetch(fetchRequest)
            self.persons = persons
        } catch {
            
        }
        
    }
}
