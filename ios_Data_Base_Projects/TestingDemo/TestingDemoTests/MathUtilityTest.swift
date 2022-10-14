//
//  MathUtilityTest.swift
//  TestingDemoTests
//
//  Created by admin on 29/09/22.
//

import XCTest
@testable import TestingDemo

final class MathUtilityTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        print("setup executed")
    }

    override func tearDownWithError() throws {
        print("teardown executed")
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAdd(){
        
        let util = MathUtility()
        
        //1. what is the test data
        let num1 = 10
        let num2 = 20
        
        //2. do the test
        
        let res = util.add(a: num1, b: num2)
        //3. verify the result
        
        XCTAssertEqual(30, res)
    }
    
    func testSub(){
        
        let util = MathUtility()
        
        //1. what is the test data
        let num1 = 10
        let num2 = 20
        
        //2. do the test
        
        let res = util.subtract(a: num1, b: num2)
        //3. verify the result
        
        XCTAssertEqual(-10, res, "result expected to be -10")
    }
    
    func testDivide() throws{
        
        let util = MathUtility()
        
        //1. what is the test data
        let num1 = 10
        let num2 = 2
        
        //2. do the test
        
        //3. verify the result
        
        XCTAssertEqual(5, try util.divide(a: num1, b: num2), "result expected to be 5")
    }
    
    func testDivideByZero() throws{
        
        let util = MathUtility()
        
        //1. what is the test data
        let num1 = 10
        let num2 = 0
        
        //2. do the test
        do{
            let res = try util.divide(a: num1, b: num2)
            XCTAssertThrowsError(res)
        }catch{
            
        }
       
        //3. verify the result
        
       // XCTAssertNil(res)
        
    }
    
    

}
