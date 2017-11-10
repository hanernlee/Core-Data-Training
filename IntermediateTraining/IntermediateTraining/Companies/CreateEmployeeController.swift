//
//  CreateEmployeeController.swift
//  IntermediateTraining
//
//  Created by Christopher Lee on 10/11/17.
//  Copyright © 2017 Christopher Lee. All rights reserved.
//

import UIKit

class CreateEmployeeController: UIViewController {
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        
        // Enable auto-layout
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Create Employee"
        
        setupCancelButton()
        
        view.backgroundColor = .darkBlue
        
        _ = setupLightBlueBackgroundView(height: 50)
        
        setupUI()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Save",
            style: .plain,
            target: self,
            action: #selector(handleSave)
        )
    }
    
    @objc func handleSave() {
        print("Saving employee")
        
        guard let employeeName = nameTextField.text else { return }
        
        let error = CoreDataManager.shared.createEmployee(employeeName: employeeName)
        
        if let error = error {
            // present an error modal
            // use uialertcontroller
            print(error)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
    
    private func setupUI() {
        // Adding Name Label
        view.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // Adding Name Text Field
        view.addSubview(nameTextField)
        nameTextField.leftAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        nameTextField.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        nameTextField.topAnchor.constraint(equalTo: nameLabel.topAnchor).isActive = true
    }
}
