//
//  MockDateProvider.swift
//  KataLoginLogout
//
//  Created by David Vallejo on 24/01/2019.
//  Copyright © 2019 David Vallejo. All rights reserved.
//

import UIKit

class MockDateProvider: DateProviding {
    var time: Int = 0
    
    func currentTimeInSeconds() -> Int {
        return time
    }
}

