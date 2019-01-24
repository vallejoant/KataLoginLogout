//
//  LoginPresenter.swift
//  KataLoginLogout
//
//  Created by David Vallejo on 24/01/2019.
//  Copyright © 2019 David Vallejo. All rights reserved.
//

import UIKit

protocol LoginPresenting {
    func login(with username: String?, password: String?) -> Result
    func logout(at time: Date) -> Result
}

class LoginPresenter: LoginPresenting {
    func login(with username: String?, password: String?) -> Result {
        if let username = username, let password = password {
            if username == "admin" && password == "admin" {
                return Result(success: true)
            }
        }
        
        return Result(success: false, error: "Login not valid")
    }
    
    func logout(at time: Date) -> Result {
        let timeInterval = time.timeIntervalSince1970
        let miliseconds = Int(timeInterval)
        
        if miliseconds % 2 == 0 {
            return Result(success: true)
        } else {
            return Result(success: false, error: "Logout fail")
        }
    }
}
