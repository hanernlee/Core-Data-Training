//
//  EmployeesController.swift
//  IntermediateTraining
//
//  Created by Christopher Lee on 9/11/17.
//  Copyright © 2017 Christopher Lee. All rights reserved.
//

import UIKit

class EmployeesController: UITableViewController {
    
    var company: Company?
    
    // MARK: - View Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.title = company?.name
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .darkBlue
        
        setupPlusButtonInNav(selector: #selector(handleAdd))
    }
    
    @objc private func handleAdd() {
        print("Trying to add employee")
    }
}
