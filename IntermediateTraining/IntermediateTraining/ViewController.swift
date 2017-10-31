//
//  ViewController.swift
//  IntermediateTraining
//
//  Created by Christopher Lee on 1/11/17.
//  Copyright © 2017 Christopher Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationItem.title = "Companies"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: #imageLiteral(resourceName: "plus").withRenderingMode(.alwaysOriginal),
            style: .plain,
            target: self,
            action: #selector(handleAddCompany)
        )
        
        setupNavigationStyle()
    }
    
    @objc func handleAddCompany() {
        print("Adding company")
    }
    
    func setupNavigationStyle() {
        let lightRed =  UIColor(red: 247/255, green: 66/255, blue: 82/255, alpha: 1)
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = lightRed
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
}

