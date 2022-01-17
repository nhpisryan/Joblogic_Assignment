//
//  JSellListViewController.swift
//  Joblogic
//
//  Created by Ryan on 16/01/2022.
//

import UIKit
import Combine

class JSellListViewController: JBaseViewController {

    private var sellListVM = JCoreDataListViewModel<JItem>(objectsVM: [])

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sell List"
        
        addTableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DItemCell.self, forCellReuseIdentifier: "DItemCell")
        getSellList()
    }
    
    func createMockItems() {
        let item1 = JItem(id: 1, name: "Table", price: 12000, quantity: 1, type: 2)
        let item2 = JItem(id: 2, name: "TV", price: 38000, quantity: 2, type: 2)
        let item3 = JItem(id: 3, name: "iPhone X", price: 150000, quantity: 1, type: 2)
        
        [item1, item2, item3].forEach({
            let itemVM = JCoreDataViewModel.init(item: $0)
            itemVM.saveItemToCoreData()
        })
    }
    
    func getSellList() {
        sellListVM.getSellItems()
        if sellListVM.objectsVM.count == 0 {
            createMockItems()
            sellListVM.getSellItems()
        }
        
        tableView.reloadData()
    }
}

extension JSellListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sellListVM.objectsVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DItemCell", for: indexPath) as! DItemCell
        cell.itemVM = sellListVM.itemAtIndex(index: indexPath.row)
        return cell
    }
}
