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
    
    private var logic: MockLoginModel!
    private var view: MockLoginViewController!
    
    override func setUp() {
        logic = MockLoginModel()
        sut = LoginPresenter(logic: logic)
        
        view = MockLoginViewController()
        sut.attachView(view: view)
    }

    override func tearDown() {

    }
    
    func testWhenPressingLoginButtonWithOKResultThenMainAppear() {
        logic.loginOK = true
        
        sut.performAccess(with: "", password: "")
        XCTAssertTrue(view.mainAppear)
    }
    
    func testWhenPressingLoginButtonWithOKResultThenAMessageAppear() {
        logic.loginOK = false
        
        sut.performAccess(with: "", password: "")
        XCTAssertTrue(view.messageAppear)
    }
    
    func testWhenPressingLogoutButtonWithOKResultThenMainAppear() {
        logic.logoutOK = true
        
        sut.performLogout()
        XCTAssertTrue(view.loginAppear)
    }
    
    func testWhenPressingLogoutButtonWithOKResultThenAMessageAppear() {
        logic.logoutOK = false
        
        sut.performLogout()
        XCTAssertTrue(view.messageAppear)
    }

    
}
