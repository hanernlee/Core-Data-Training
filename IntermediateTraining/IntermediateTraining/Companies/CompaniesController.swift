//
//  ViewController.swift
//  IntermediateTraining
//
//  Created by Christopher Lee on 1/11/17.
//  Copyright © 2017 Christopher Lee. All rights reserved.
//

import UIKit
import CoreData

class CompaniesController: UITableViewController {

    var companies = [Company]()
    
    // MARK: view lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.companies = CoreDataManager.shared.fetchCompanies()
        
        view.backgroundColor = .white
        
        navigationItem.title = "Companies"
        
        tableView.backgroundColor = .darkBlue

        tableView.separatorColor = .white
        tableView.tableFooterView = UIView() // get rid of lines at the bottom
        
        tableView.register(CompanyCell.self, forCellReuseIdentifier: "cellId")
        
        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(handleReset)),
            UIBarButtonItem(title: "Do Updates", style: .plain, target: self, action: #selector(doUpdates))
        ]
        
        setupPlusButtonInNav(selector: #selector(handleAddCompany))
    }
    
    @objc private func doUpdates() {
        print("Trying to update compannies in background context")
        
        CoreDataManager.shared.persistentContainer.performBackgroundTask({ (backgroundContext) in
            
            let request: NSFetchRequest<Company> = Company.fetchRequest()
            
            do {
                let companies = try backgroundContext.fetch(request)
                
                companies.forEach { (company) in
                    print(company.name ?? "")
                    company.name = "A: \(company.name ?? "")"
                }

                do {
                    try backgroundContext.save()
                    
                    DispatchQueue.main.async {
                        
                        // Bad method: reset() will forget all of the objects fetched before
                        CoreDataManager.shared.persistentContainer.viewContext.reset()
                        self.companies = CoreDataManager.shared.fetchCompanies()
                        self.tableView.reloadData()
                    }
                    
                } catch let error {
                    print("Failed to save", error)
                }
            } catch let error {
                print("Failed fetching companies", error)
            }
        })
    }
    
    @objc private func doWork() {
        print("Trying to create companies in the background")
        
        CoreDataManager.shared.persistentContainer.performBackgroundTask({ (backgroundContext) in
            (0...5).forEach { (value) in
                let company = Company(context: backgroundContext)
                company.name = String(value)
            }
            
            do {
                try backgroundContext.save()
                
                DispatchQueue.main.async {
                    self.companies = CoreDataManager.shared.fetchCompanies()
                    self.tableView.reloadData()
                }
                
            } catch let error {
                print("Failed to save", error)
            }
        })
        
        // Grand Central Dispatch
//        DispatchQueue.global(qos: .background).async  {
//            // Creating some company objects in a background thread
//        }
    }
    
    @objc private func handleReset() {
        print("Attempting to delete all Core Data Objects")
        
        let context = CoreDataManager.shared.persistentContainer.viewContext
        
        companies.forEach {
            (company) in
            context.delete(company)
        }
        
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: Company.fetchRequest())
        
        do {
            try context.execute(batchDeleteRequest)
            
            var indexPathsToRemove = [IndexPath]()
            
            for (index, _) in companies.enumerated() {
                let indexPath = IndexPath(row: index, section: 0)
                indexPathsToRemove.append(indexPath)
            }
            companies.removeAll()
            tableView.deleteRows(at: indexPathsToRemove, with: .left)
            
        } catch let deleteError {
            print("Failed to delete objects from Core Data:", deleteError)
        }
    }
    
    @objc func handleAddCompany() {
        print("Adding company")
        
        let createCompanyController = CreateCompanyController()
        
        let navController = CustomNavigationController(rootViewController: createCompanyController)
        
        createCompanyController.delegate = self
        
        present(navController, animated: true, completion: nil)
    }
}

