//
//  LoginLogic.swift
//  KataLoginLogout
//
//  Created by David Vallejo on 24/01/2019.
//  Copyright © 2019 David Vallejo. All rights reserved.
//

import UIKit

protocol LoginModeling {
    func login(with username: String?, password: String?) -> Result
    func logout() -> Result
}

class LoginModel: LoginModeling {
    private var dateProvider : DateProviding!
    
    public init(dateProvider: DateProviding = DateProvider()){
        self.dateProvider = dateProvider
    }

    func login(with username: String?, password: String?) -> Result {
        if let username = username, let password = password {
            if username == "admin" && password == "admin" {
                return Result(success: true)
            }
        }
        
        return Result(success: false, error: "Login not valid")
    }
    
    func logout() -> Result {
        if dateProvider.currentTimeInSeconds() % 2 == 0 {
            return Result(success: true)
        } else {
            return Result(success: false, error: "Logout fail")
        }
    }
}
