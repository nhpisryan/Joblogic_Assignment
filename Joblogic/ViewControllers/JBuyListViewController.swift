//
//  JBuyListViewController.swift
//  Joblogic
//
//  Created by Ryan on 16/01/2022.
//

import UIKit

class JBuyListViewController: JBaseViewController {

    private var buyListVM: JGenericListViewModel<JItem>!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Buy List"
        
        addTableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DItemCell.self, forCellReuseIdentifier: "DItemCell")
        
        getBuyList()
    }
    
    func getBuyList() {
        let resource = Resource<JItem>(url: URL(string: "https://my-json-server.typicode.com/imkhan334/demo-1/buy")!)
        URLRequest.load(resource: resource) { [weak self] items in
            guard let this = self else {return}
            if let items = items {
                let itemsVM = items.map({JGenericViewModel<JItem>.init(object: $0)})
                this.buyListVM = JGenericListViewModel<JItem>(objectsVM: itemsVM)
                DispatchQueue.main.async {
                    this.tableView.reloadData()
                }
            }
        }
    }
}

extension JBuyListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.buyListVM == nil ? 0: self.buyListVM.objectsVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DItemCell", for: indexPath) as! DItemCell
        let itemVM = buyListVM.itemVMAt(indexPath.row)
        cell.itemVM = itemVM
        return cell
    }
}
