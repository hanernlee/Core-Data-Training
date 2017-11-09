//
//  UIViewController+Helpers.swift
//  IntermediateTraining
//
//  Created by Christopher Lee on 10/11/17.
//  Copyright © 2017 Christopher Lee. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setupPlusButtonInNav(selector: Selector) {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: #imageLiteral(resourceName: "plus").withRenderingMode(.alwaysOriginal),
            style: .plain,
            target: self,
            action: #selector(selector)
        )
    }
}
