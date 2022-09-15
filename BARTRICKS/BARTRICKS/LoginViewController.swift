//
//  LoginViewController.swift
//  SideMenu
//
//  Created by chaitanya on 13/09/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var signinBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        signupBtn.layer.borderWidth = 1
        signinBtn.layer.borderWidth = 1
        signinBtn.layer.borderColor = #colorLiteral(red: 0.9999071956, green: 1, blue: 0.999881804, alpha: 1)
        signupBtn.layer.borderColor = #colorLiteral(red: 0.9999071956, green: 1, blue: 0.999881804, alpha: 1)
        signupBtn.layer.cornerRadius = 19
        signinBtn.layer.cornerRadius = 19
        
       
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as? MainViewController
        storyBoard?.modalTransitionStyle = .crossDissolve
        self.navigationController?.pushViewController(storyBoard!, animated: true)
        
        
    }
    
   

}
