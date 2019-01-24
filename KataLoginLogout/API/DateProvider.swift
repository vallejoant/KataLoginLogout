//
//  DateProvider.swift
//  KataLoginLogout
//
//  Created by David Vallejo on 24/01/2019.
//  Copyright © 2019 David Vallejo. All rights reserved.
//

import UIKit

protocol DateProviding {
    func currentTimeInSeconds() -> Int
}

class DateProvider: DateProviding {
    func currentTimeInSeconds() -> Int {
        let timeInterval = Date().timeIntervalSince1970
        return Int(timeInterval)
    }
}
