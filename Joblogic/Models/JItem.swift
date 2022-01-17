//
//  JItem.swift
//  Joblogic
//
//  Created by Ryan on 16/01/2022.
//

import Foundation

enum JItemType {
    case buy
    case sell

    var type: Int {
        switch self {
        case .buy:
            return 1
        case .sell:
            return 2
        }
    }
}

class JItem: Codable {
    var id: Int?
    var name: String?
    var price: Int?
    var quantity: Int?
    var type: Int?

    init(id: Int?, name: String?, price: Int?, quantity: Int?, type: Int?) {
        self.id = id
        self.name = name
        self.price = price
        self.quantity = quantity
        self.type = type
    }
}
