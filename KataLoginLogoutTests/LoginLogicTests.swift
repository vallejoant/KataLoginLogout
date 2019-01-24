//
//  LoginLogicTests.swift
//  KataLoginLogoutTests
//
//  Created by David Vallejo on 24/01/2019.
//  Copyright © 2019 David Vallejo. All rights reserved.
//

import XCTest

class LoginLogicTests: XCTestCase {
    private var sut: LoginModel!
    private var dateProvider: MockDateProvider!
    
    override func setUp() {
        dateProvider = MockDateProvider()
        sut = LoginModel(dateProvider: dateProvider)
    }
    
    override func tearDown() {
        
    }
    
    func testWhenReceiveValidCredentialsThenTheLoginIsOK() {
        let expectation = XCTestExpectation(description: "Login perfomed")
        
        sut.login(with: "admin", password: "admin") { result in
            XCTAssertTrue(result.success)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testWhenReceiveNoCredentialsThenTheLoginIsKO() {
        let expectation = XCTestExpectation(description: "Login perfomed")
        
        sut.login(with: nil, password: nil) { result in
            XCTAssertFalse(result.success)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testWhenReceiveInvalidCredentialsThenTheLoginIsKO() {
        let expectation = XCTestExpectation(description: "Login perfomed")
        
        sut.login(with: "asds", password: "zdfz") { result in
            XCTAssertFalse(result.success)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testWhenDateIsOddThenTheLogoutIsPerformed() {
        let expectation = XCTestExpectation(description: "Logut perfomed")
        
        dateProvider.time = 111112
        
        sut.logout() { result in
            XCTAssertTrue(result.success)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testWhenDateIsEvenThenTheLogoutIsKO() {
        let expectation = XCTestExpectation(description: "Logut perfomed")
        
        dateProvider.time = 111113
        
        sut.logout() { result in
            XCTAssertFalse(result.success)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
}
