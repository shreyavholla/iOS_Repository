//
//  MathUtility.swift
//  TestingDemo
//
//  Created by admin on 29/09/22.
//

import Foundation


struct MathUtility {
    
    enum MathError : Error {
        
        case divideByZero
        case invalidArgument
    }
    func add(a: Int, b: Int) -> Int {
        
        return a + b
    }
    
    func subtract(a: Int, b: Int) -> Int {
        
        return a - b
    }
    
    func multiply(a: Int, b: Int) -> Int {
        
        return a * b
    }
    
    func divide(a: Int, b: Int) throws -> Int {
        
        guard b != 0 else {
            
            throw MathError.divideByZero
        }
        
        return a/b
        
    }
    
    func modulo(a: Int, b: Int) -> Int {
        
        return a % b
    }
}
