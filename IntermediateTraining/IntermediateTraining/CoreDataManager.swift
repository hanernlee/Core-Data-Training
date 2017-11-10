//
//  CoreDataManager.swift
//  IntermediateTraining
//
//  Created by Christopher Lee on 2/11/17.
//  Copyright © 2017 Christopher Lee. All rights reserved.
//

import CoreData

struct CoreDataManager {
    static let shared = CoreDataManager() // Will live forever as long as application is still alive, it's properties will too

    // shared Singleton now has a property called persistentContainer
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "IntermediateTrainingModels")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("Loading of store failed: \(error)")
            }
        }
        return container
    }()
    
    func fetchCompanies() -> [Company] {
        let context = persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<Company>(entityName: "Company")
        
        do {
            let companies = try context.fetch(fetchRequest)
            return companies
        } catch let fetchError {
            print("Failed to fetch companies: \(fetchError)")
            return []
        }
    }
    
    func createEmployee(employeeName: String) -> (Employee?, Error?) {
        let context = persistentContainer.viewContext
        
        let employee = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context) as! Employee
        
        employee.setValue(employeeName, forKey: "name")
        
        do {
            try context.save()
            return (employee, nil)
        } catch let saveError {
            print("Failed to save data:", saveError)
            return (nil, saveError)
        }
    }
}
