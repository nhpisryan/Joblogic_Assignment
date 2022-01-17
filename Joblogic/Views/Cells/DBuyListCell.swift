//
//  DBuyListCell.swift
//  Joblogic
//
//  Created by Ryan on 16/01/2022.
//

import UIKit
import Foundation

class DItemCell: UITableViewCell {
    
    private lazy var itemNameLabel = UILabel()
    private lazy var itemPriceLabel = UILabel()
    private lazy var itemQuantityLabel = UILabel()

    var itemVM: JGenericViewModel<JItem>? {
        didSet {
            let item = itemVM?.getItem()
            if let name = item?.name {
                itemNameLabel.text = String(format: "Name: %@", name)
            }
            
            if let price = item?.price {
                itemPriceLabel.text = String(format: "Price: %ld", price)
            }
            
            if let quantity = item?.quantity {
                itemQuantityLabel.text = String(format: "Quantity: %d", quantity)
            }
            
            if let type = item?.type {
                switch type {
                case JItemType.buy.type:
                    contentView.backgroundColor = .gray
                case JItemType.sell.type:
                    contentView.backgroundColor = .orange
                default:
                    break
                }
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("Interface Builder is not supported!")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        itemNameLabel.text = nil
        itemPriceLabel.text = nil
        itemQuantityLabel.text = nil
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .gray
        
        itemNameLabel = JLabel.makeRegularLabel(text: nil)
        itemPriceLabel = JLabel.makeRegularLabel(text: nil)
        itemQuantityLabel = JLabel.makeRegularLabel(text: nil)
        
        contentView.addSubview(itemNameLabel)
        contentView.addSubview(itemPriceLabel)
        contentView.addSubview(itemQuantityLabel)

        itemNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0).isActive = true
        itemNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0).isActive = true
        
        itemPriceLabel.leadingAnchor.constraint(equalTo: itemNameLabel.leadingAnchor, constant: 0.0).isActive = true
        itemPriceLabel.topAnchor.constraint(equalTo: itemNameLabel.bottomAnchor, constant: 10.0).isActive = true
        
        itemQuantityLabel.leadingAnchor.constraint(equalTo: itemNameLabel.leadingAnchor, constant: 0.0).isActive = true
        itemQuantityLabel.topAnchor.constraint(equalTo: itemPriceLabel.bottomAnchor, constant: 10.0).isActive = true
        itemQuantityLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10.0).isActive = true
    }
}

