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
}