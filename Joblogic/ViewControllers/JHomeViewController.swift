//
//  ViewController.swift
//  Joblogic
//
//  Created by Ryan on 16/01/2022.
//

import UIKit

class JHomeViewController: JBaseViewController {

    private lazy var buttonsStackView = UIStackView()
    private lazy var callListButton = UIButton()
    private lazy var buyListButton = UIButton()
    private lazy var sellListButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonsStackView)
        buttonsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0.0).isActive = true
        buttonsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0.0).isActive = true
        buttonsStackView.axis = .vertical
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.spacing = 10.0
        
        callListButton = JButton.makeRegularButton(text: "Call List")
        buyListButton = JButton.makeRegularButton(text: "Buy List")
        sellListButton = JButton.makeRegularButton(text: "Sell List")
        [callListButton, buyListButton, sellListButton].forEach({
            buttonsStackView.addArrangedSubview($0)
        })
        
        callListButton.addTarget(self, action: #selector(onTapCallList), for: .touchUpInside)
        buyListButton.addTarget(self, action: #selector(onTapBuyList), for: .touchUpInside)
        sellListButton.addTarget(self, action: #selector(onTapSellList), for: .touchUpInside)
    }
    
    @objc func onTapCallList() {
        let vc = JCallListViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func onTapBuyList() {
        let vc = JBuyListViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func onTapSellList() {
        let vc = JSellListViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

