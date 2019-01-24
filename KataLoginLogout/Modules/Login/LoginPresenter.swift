//
//  LoginPresenter.swift
//  KataLoginLogout
//
//  Created by David Vallejo on 24/01/2019.
//  Copyright © 2019 David Vallejo. All rights reserved.
//

import UIKit

protocol LoginPresenting {
    func attachView(view: LoginView)
    func performAccess(with username: String?, password: String?)
    func performLogout()
}

class LoginPresenter: LoginPresenting {
    private var view : LoginView?
    private var logic : LoginModeling!
    
    public init(logic: LoginModeling = LoginModel()){
        self.logic = logic
    }
    
    func attachView(view: LoginView) {
        self.view = view
    }
    
    func performAccess(with username: String?, password: String?) {
        logic.login(with: username, password: password) { result in
            if result.success {
                view?.showMain()
            } else {
                view?.showMessage("KO", message: result.errorMessage)
            }
        }
    }
    
    func performLogout() {
        logic.logout() { result in
            if result.success {
                view?.showLogin()
            } else {
                view?.showMessage("KO", message: result.errorMessage)
            }
        }
    }
}
