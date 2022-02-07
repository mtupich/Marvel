//
//  DataBaseController.swift
//  projeto-marvel
//
//  Created by C94279A on 13/12/21.
//

import Foundation
import CoreData

class CoreDataController: CoreDataControllerProtocol{
    var context: NSManagedObjectContext = DataBaseController.persistentContainer.viewContext
    
    func getdataFromCoreData() -> [SuperHeroEntity]{
        
        var data : [SuperHeroEntity] = []
        do {
            data = try DataBaseController.persistentContainer.viewContext.fetch(SuperHeroEntity.fetchRequest())
        } catch {
            print("Something went wrong")
        }
        return data
    }
    
    
    func saveCharacterInTheDataBase(heroes: [Hero]) {
        let save = DataBaseController.persistentContainer.viewContext
        for hero in heroes {
            if !CoreDataController.checkIfHeroExistInCoreData(heroId: hero.id) {
                save.processPendingChanges()
                let data = SuperHeroEntity(context: save)
                
                data.heroId = hero.id
                data.heroName = hero.name
                data.imageHeroPath = hero.thumbnail.path
                data.imageHeroExtension = hero.thumbnail.`extension`
            }
        }
        
        DataBaseController.saveContext { result in
            switch result {
            case .success:
                print("salvando")
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    static func checkIfHeroExistInCoreData(heroId: Int32) -> Bool {
        
        let managedContext = DataBaseController.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "SuperHeroEntity")
        fetchRequest.fetchLimit =  1
        fetchRequest.predicate = NSPredicate(format: "heroId == %d", heroId)
        
        do {
            let count = try managedContext.count(for: fetchRequest)
            if count > 0 {
                return true
            }else {
                return false
            }
        }catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return false
        }
    }
    
    func clearDataFromCoreData() {
        let context = DataBaseController.persistentContainer.viewContext
        do {
            let items = try context.fetch(SuperHeroEntity.fetchRequest()) 
            for item in items {
                context.delete(item)
            }
            try context.save()
            print("Data has been deleted sucessfully")
            
        } catch {
            print("Error during the process of delation")
        }
        
    }
}

