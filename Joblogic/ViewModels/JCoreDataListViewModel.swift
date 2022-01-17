//
//  JSellListViewModel.swift
//  Joblogic
//
//  Created by Ryan on 16/01/2022.
//

import Foundation
import Combine
import CoreData

class JCoreDataListViewModel<JItem>: JGenericListViewModel<JItem> {
    
    func getSellItems() {
        let items = JCoreDataManager.shared.getSellItems().map({$0.toJItem()})
        self.objectsVM = items.map({JGenericViewModel<JItem>.init(object: $0 as? JItem)})
    }

    func itemAtIndex(index: Int) -> JGenericViewModel<JItem> {
        return objectsVM[index]
    }
}

struct JCoreDataViewModel {
    let item: JItem
    
    init(item: JItem) {
        self.item = item
    }

    func saveItemToCoreData() {
        let manager = JCoreDataManager.shared
        let itemToSell = ItemToSell(context: manager.persistentContainer.viewContext)
        
        itemToSell.name = item.name
        if let price = item.price {
            itemToSell.price = Int32(price)
        }
        if let quantity = item.quantity {
            itemToSell.quantity = Int16(quantity)
        }
        if let type = item.type {
            itemToSell.type = Int16(type)
        }
        
        manager.save()
    }
}
