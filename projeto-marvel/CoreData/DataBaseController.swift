//
//  CoreDataController.swift
//  projeto-marvel
//
//  Created by C94279A on 15/12/21.
//

import CoreData

class DataBaseController {
    // MARK: - Core Data stack
    
    static var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "projeto-marvel")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    static func saveContext(completion: @escaping (Result<Void, Error>) -> Void) {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
                completion(Result.success(()))
            } catch let error {
                completion(Result.failure(error))
            }
        }
    }
    
}



