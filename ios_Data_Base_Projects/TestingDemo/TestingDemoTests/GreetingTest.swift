//
//  GreetingTest.swift
//  TestingDemoTests
//
//  Created by admin on 29/09/22.
//

import XCTest

@testable import TestingDemo

final class GreetingTest: XCTestCase {

    func testNotAvailable(){
        
        //with
        let firstName: String? = nil
        let lastname: String? = nil
        //test
        
        let msg = Greeting().createGreeting(firstname: firstName,lastname: lastname)
        
        //verify
        
        XCTAssertNil(msg)
    }
    
    func testFirstNameOnly(){
        
        let firstName = "John"
        let lastname: String? = nil
        //test
        
        let msg = Greeting().createGreeting(firstname: firstName,lastname: lastname)
        
        //verify
        
        XCTAssertEqual("Hello John", msg)
        
    }
    
    func testLastNameOnly(){
        
        let firstName: String? = nil
        let lastname = "Smith"
        //test
        
        let msg = Greeting().createGreeting(firstname: firstName,lastname: lastname)
        
        //verify
        
        XCTAssertEqual("Hello Smith", msg)
    }
    
    func testBothAvailable(){
        
        let firstName = "John"
        let lastName = "Smith"
        
        let msg = Greeting().createGreeting(firstname: firstName,lastname: lastName)
        XCTAssertEqual("Good Day, Mr. John Smith", msg)
    }
    
    
    
}
