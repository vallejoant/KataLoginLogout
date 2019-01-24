//
//  LoginViewController.swift
//  KataLoginLogout
//
//  Created by David Vallejo on 24/01/2019.
//  Copyright © 2019 David Vallejo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var accessButton: UIButton!
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var logoutButton: UIButton!
    
    var presenter: LoginPresenting!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Kata Login Logout"
        
        showLogin()
    }
}

extension LoginViewController {
    private func showMain() {
        loginView.isHidden = true
        mainView.isHidden = false
    }
    
    private func showLogin() {
        loginView.isHidden = false
        mainView.isHidden = true
    }
    
    private func showMessage(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

extension LoginViewController {
    @IBAction func accessAction(_ sender: Any) {
        let loginResult = presenter.login(with: userTextField.text, password: passTextField.text)
        
        if loginResult.success {
            showMain()
        } else {
            showMessage("KO", message: loginResult.errorMessage)
        }
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        let logoutResult = presenter.logout(at: Date())
        
        if logoutResult.success {
            showLogin()
        } else {
            showMessage("KO", message: logoutResult.errorMessage)
        }
    }
    
}
