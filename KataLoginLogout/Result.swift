//
//  Result.swift
//  KataLoginLogout
//
//  Created by David Vallejo on 24/01/2019.
//  Copyright © 2019 David Vallejo. All rights reserved.
//

import UIKit

class Result {
    let success: Bool
    let errorMessage: String
    
    public init(success: Bool, error: String = "") {
        self.success = success
        self.errorMessage = error
    }
}
