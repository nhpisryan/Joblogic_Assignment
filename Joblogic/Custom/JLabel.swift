//
//  JLabel.swift
//  Joblogic
//
//  Created by Ryan on 16/01/2022.
//

import Foundation
import UIKit

class JLabel {
    
    static func makeBaseLabel(text: String?) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.numberOfLines = 0
        return label
    }
    
    static func makeRegularLabel(text: String?, color: UIColor? = .black) -> UILabel {
        let label = JLabel.makeBaseLabel(text: text)
        label.textColor = color
        label.font = .systemFont(ofSize: 14.0)
        return label
    }
}
