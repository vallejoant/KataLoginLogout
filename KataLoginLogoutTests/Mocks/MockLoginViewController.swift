//
//  MockLoginViewController.swift
//  KataLoginLogout
//
//  Created by David Vallejo on 24/01/2019.
//  Copyright © 2019 David Vallejo. All rights reserved.
//

import UIKit

class MockLoginViewController: LoginView {
    var mainAppear = false
    func showMain() {
        mainAppear = true
    }
    
    var loginAppear = false
    func showLogin() {
        loginAppear = true
    }
    
    var messageAppear = false
    func showMessage(_ title: String, message: String) {
        messageAppear = true
    }
}
