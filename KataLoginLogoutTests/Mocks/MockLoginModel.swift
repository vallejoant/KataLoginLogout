//
//  MockLoginLogic.swift
//  KataLoginLogout
//
//  Created by David Vallejo on 24/01/2019.
//  Copyright © 2019 David Vallejo. All rights reserved.
//

import UIKit

class MockLoginModel: LoginModeling {
    var loginOK: Bool = true
    var logoutOK: Bool = true
    
    func login(with username: String?, password: String?, completionHandler: (_ result: Result) -> Void) {
        completionHandler(Result(success: loginOK))
    }
    
    func logout(completionHandler: (_ result: Result) -> Void) {
        completionHandler(Result(success: logoutOK))
    }
}
