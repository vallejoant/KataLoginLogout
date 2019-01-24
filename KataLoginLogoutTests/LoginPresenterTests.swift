//
//  LoginPresenterTests.swift
//  KataLoginLogoutTests
//
//  Created by David Vallejo on 24/01/2019.
//  Copyright © 2019 David Vallejo. All rights reserved.
//

import XCTest
@testable import KataLoginLogout

class LoginPresenterTests: XCTestCase {
    private var sut: LoginPresenter!
    private var dateProvider: MockDateProvider!
    
    override func setUp() {
        dateProvider = MockDateProvider()
        sut = LoginPresenter(dateProvider: dateProvider)
    }

    override func tearDown() {

    }

    func testWhenReceiveValidCredentialsThenTheLoginIsOK() {
        let result = sut.login(with: "admin", password: "admin")
        XCTAssertTrue(result.success)
    }
    
    func testWhenReceiveNoCredentialsThenTheLoginIsKO() {
        let result = sut.login(with: nil, password: nil)
        XCTAssertFalse(result.success)
    }
    
    func testWhenReceiveInvalidCredentialsThenTheLoginIsKO() {
        let result = sut.login(with: "asds", password: "zdfz")
        XCTAssertFalse(result.success)
    }
    
    func testWhenDateIsOddThenTheLogoutIsPerformed() {
        dateProvider.time = 111112
        
        let result = sut.logout()
        XCTAssertTrue(result.success)
    }
    
    func testWhenDateIsEvenThenTheLogoutIsKO() {
        dateProvider.time = 111113
        
        let result = sut.logout()
        XCTAssertFalse(result.success)
    }
}
