//
//  UtilityFunctions.swift
//  SideMenu
//
//  Created by chaitanya on 05/09/22.
//

import Foundation
import UIKit



class UtilityFunction:NSObject {
    
    let stroryBoard = UIStoryboard(name: "Main", bundle: nil)
    func userSelected(Object:String) {
        UserDefaults.standard.set(Object, forKey: "Name")
        UserDefaults.standard.synchronize()
    }
    func getUserSelected()-> String {
        return UserDefaults.standard.string(forKey: "Name") ?? "Empty"
    }
    
    
    
    func navigateToMainViewcontroller(_ currentViewController: UIViewController) {
        let screen = stroryBoard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        screen.modalTransitionStyle = .crossDissolve
        if let navigation = currentViewController as? Navigation {
            navigation.setViewControllers([screen], animated: true)
        } else {
            currentViewController.navigationController?.setViewControllers([screen], animated: true)
        }
    }
    
    func navigateToLoginController(_ currentViewController: UIViewController) {
        let screen = stroryBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        screen.modalTransitionStyle = .crossDissolve
        if let navigation = currentViewController as? Navigation {
            navigation.setViewControllers([screen], animated: true)
        } else {
            currentViewController.navigationController?.setViewControllers([screen], animated: true)
        }
    }
    
}
