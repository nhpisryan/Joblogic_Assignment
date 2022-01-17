//
//  JCallListViewController.swift
//  Joblogic
//
//  Created by Ryan on 16/01/2022.
//

import UIKit

class JCallListViewController: JBaseViewController {

    private var callListVM: JGenericListViewModel<JPerson>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Call List"

        addTableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DCallListCell.self, forCellReuseIdentifier: "DCallListCell")

        getCallList()
    }
    
    func getCallList() {
        let resource = Resource<JPerson>(url: URL(string: "https://my-json-server.typicode.com/imkhan334/demo-1/call")!)
        URLRequest.load(resource: resource) { [weak self] peoples in
            guard let this = self else {return}
            if let peoples = peoples {
                let peoplesVM = peoples.map({JGenericViewModel<JPerson>.init(object: $0)})
                this.callListVM = JGenericListViewModel<JPerson>(objectsVM: peoplesVM)
                DispatchQueue.main.async {
                    this.tableView.reloadData()
                }
            }
        }
    }
}

extension JCallListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.callListVM == nil ? 0: self.callListVM.objectsVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DCallListCell", for: indexPath) as! DCallListCell
        let personVM = callListVM.itemVMAt(indexPath.row)
        cell.personVM = personVM
        return cell
    }
}
