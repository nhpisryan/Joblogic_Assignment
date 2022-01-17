//
//  JCoreDataManager.swift
//  Joblogic
//
//  Created by Ryan on 16/01/2022.
//

import Foundation
import CoreData

class JCoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    static let shared = JCoreDataManager()
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "Joblogic")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Core Data failed to init \(error.localizedDescription)")
            }
        }
    }
    
    func save() {
        do {
            try persistentContainer.viewContext.save()
        } catch {
            debugPrint("Failed to saved ItemToSell \(error.localizedDescription)")
        }
    }
    
    func getSellItems() -> [ItemToSell] {
        let fetchRequest: NSFetchRequest<ItemToSell> = ItemToSell.fetchRequest()
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
}
