//
//  EmployeesController.swift
//  IntermediateTraining
//
//  Created by Christopher Lee on 9/11/17.
//  Copyright © 2017 Christopher Lee. All rights reserved.
//

import UIKit
import CoreData

class EmployeesController: UITableViewController, CreateEmployeeControllerDelegate {
    
    var company: Company?
    
    var employees = [Employee]()
    
    let cellID = "employeeCell"
    
    func didAddEmployee(employee: Employee) {
        employees.append(employee)
        
//        let newIndexPath = IndexPath(row: employees.count - 1, section: 0)
//        tableView.insertRows(at: [newIndexPath], with: .automatic)
        
        tableView.reloadData()
    }
    
    // MARK: - View Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.title = company?.name
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .darkBlue
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        
        setupPlusButtonInNav(selector: #selector(handleAdd))
        
        fetchEmployees()
    }
    
    private func fetchEmployees() {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        
        let request = NSFetchRequest<Employee>(entityName: "Employee")
        
        do {
            let employees = try context.fetch(request)
            
            self.employees = employees
        } catch let error {
            print("Failed to fetch employees", error)
        }
    }
    
    @objc private func handleAdd() {
        print("Trying to add employee")
        
        let createEmployeeController = CreateEmployeeController()
        createEmployeeController.delegate = self
        let navController = UINavigationController(rootViewController: createEmployeeController)
        
        present(navController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        let employee = employees[indexPath.row]
        cell.textLabel?.text = employee.name

        if let taxId = employee.employeeInformation?.taxId {
            cell.textLabel?.text = "\(employee.name ?? "")    \(taxId)"
        }
        
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        cell.backgroundColor = .tealColor
        
        return cell
    }
}
