//
//  Navigation.swift
//  SideMenu
//
//  Created by chaitanya on 12/09/22.
//

import UIKit

class Navigation: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //UtilityFunction().navigateToMainViewcontroller(self)
        UtilityFunction().navigateToLoginController(self)
    }
    
   
}
