//
//  CoreDataProtocol.swift
//  projeto-marvel
//
//  Created by C94279A on 14/01/22.
//

import Foundation
import CoreData

protocol CoreDataControllerProtocol {
    var context: NSManagedObjectContext { get set }
    func getdataFromCoreData() -> [SuperHeroEntity]
    func saveCharacterInTheDataBase(heroes: [Hero])
    func clearDataFromCoreData() 
}



