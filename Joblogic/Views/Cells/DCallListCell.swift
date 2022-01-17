//
//  DCallListTableViewCell.swift
//  Joblogic
//
//  Created by Ryan on 16/01/2022.
//

import UIKit
import Foundation

class DCallListCell: UITableViewCell {
    
    private lazy var personNameLabel = UILabel()
    private lazy var personPhoneLabel = UILabel()

    var personVM: JGenericViewModel<JPerson>? {
        didSet {
            let person = personVM?.getItem()
            personNameLabel.text = person?.name
            personPhoneLabel.text = person?.number
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("Interface Builder is not supported!")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        personNameLabel.text = nil
        personPhoneLabel.text = nil
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .gray
        
        personNameLabel = JLabel.makeRegularLabel(text: nil)
        personPhoneLabel = JLabel.makeRegularLabel(text: nil)
        
        contentView.addSubview(personNameLabel)
        contentView.addSubview(personPhoneLabel)

        personNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0).isActive = true
        personNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0).isActive = true
        
        personPhoneLabel.leadingAnchor.constraint(equalTo: personNameLabel.leadingAnchor, constant: 0.0).isActive = true
        personPhoneLabel.topAnchor.constraint(equalTo: personNameLabel.bottomAnchor, constant: 10.0).isActive = true
        personPhoneLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10.0).isActive = true
    }
}
