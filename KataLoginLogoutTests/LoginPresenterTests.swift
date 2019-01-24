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
    var sut: LoginPresenter!
    
    override func setUp() {
        sut = LoginPresenter()
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
        let result = sut.logout(at: Date.init(timeIntervalSince1970: 122342344))
        XCTAssertTrue(result.success)
    }
    
    func testWhenDateIsEvenThenTheLogoutIsKO() {
        let result = sut.logout(at: Date.init(timeIntervalSince1970: 122342343))
        XCTAssertFalse(result.success)
    }
}
