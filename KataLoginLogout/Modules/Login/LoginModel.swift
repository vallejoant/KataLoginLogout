//
//  LoginLogic.swift
//  KataLoginLogout
//
//  Created by David Vallejo on 24/01/2019.
//  Copyright © 2019 David Vallejo. All rights reserved.
//

import UIKit

protocol LoginModeling {
    func login(with username: String?, password: String?, completionHandler: (_ result: Result) -> Void)
    func logout(completionHandler: (_ result: Result) -> Void)
}

class LoginModel: LoginModeling {
    private var dateProvider : DateProviding!
    
    public init(dateProvider: DateProviding = DateProvider()){
        self.dateProvider = dateProvider
    }

    func login(with username: String?, password: String?, completionHandler: (_ result: Result) -> Void) {
        if let username = username, let password = password {
            if username == "admin" && password == "admin" {
                completionHandler(Result(success: true))
                return
            }
        }
        
        completionHandler(Result(success: false, error: "Login not valid"))
    }
    
    func logout(completionHandler: (_ result: Result) -> Void) {
        if dateProvider.currentTimeInSeconds() % 2 == 0 {
            completionHandler(Result(success: true))
        } else {
            completionHandler(Result(success: false, error: "Logout fail"))
        }
    }
}
