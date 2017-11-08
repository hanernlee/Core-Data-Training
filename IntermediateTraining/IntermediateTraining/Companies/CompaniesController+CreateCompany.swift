//
//  CompaniesController+CreateCompany.swift
//  IntermediateTraining
//
//  Created by Christopher Lee on 8/11/17.
//  Copyright © 2017 Christopher Lee. All rights reserved.
//

import UIKit

extension CompaniesController: CreateCompanyControllerDelegate {
    func didAddCompany(company: Company) {
        companies.append(company)
        
        let newIndexPath = IndexPath(row: companies.count - 1, section: 0)
        tableView.insertRows(at: [newIndexPath], with: .automatic)
    }
    
    func didEditCompany(company: Company) {
        let row = companies.index(of: company)
        
        let reloadIndexPath = IndexPath(row: row!, section: 0)
        tableView.reloadRows(at: [reloadIndexPath], with: .middle)
    }
}
