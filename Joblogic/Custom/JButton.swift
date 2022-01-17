//
//  JButton.swift
//  Joblogic
//
//  Created by Ryan on 16/01/2022.
//

import Foundation
import UIKit

class JButton {
    
    static let JBUTTON_HEIGHT: CGFloat = 48.0
    
    static func makeRegularButton(text: String?) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: JBUTTON_HEIGHT).isActive = true
        button.setTitle(text, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 6.0
        return button
    }
}
