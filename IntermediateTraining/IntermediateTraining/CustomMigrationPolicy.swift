//
//  CustomMigrationPolicy.swift
//  IntermediateTraining
//
//  Created by Christopher Lee on 13/11/17.
//  Copyright © 2017 Christopher Lee. All rights reserved.
//

import CoreData

class CustomMigrationPolicy: NSEntityMigrationPolicy {
    @objc func transformNumEmployees(forNum: NSNumber) -> String {
        if forNum.intValue < 150 {
            return "small"
        } else {
            return "very large"
        }
    }
}
