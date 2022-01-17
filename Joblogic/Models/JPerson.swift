//
//  JPerson.swift
//  Joblogic
//
//  Created by Ryan on 16/01/2022.
//

import Foundation

class JPerson: Codable {
    var id: Int?
    var name, number: String?

    init(id: Int?, name: String?, number: String?) {
        self.id = id
        self.name = name
        self.number = number
    }
}
