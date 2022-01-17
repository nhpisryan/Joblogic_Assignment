//
//  ItemToSell+Extension.swift
//  Joblogic
//
//  Created by Ryan on 17/01/2022.
//

import Foundation

extension ItemToSell {
    func toJItem() -> JItem {
        let item = JItem(id: nil, name: self.name, price: nil, quantity: nil, type: nil)
        item.price = Int(price)
        item.quantity = Int(quantity)
        item.type = Int(type)
        return item
    }
}
