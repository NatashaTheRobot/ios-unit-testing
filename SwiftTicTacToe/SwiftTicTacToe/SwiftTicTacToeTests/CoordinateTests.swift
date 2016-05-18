//
//  CoordinateTests.swift
//  SwiftTicTacToe
//
//  Created by Natasha Murashev on 1/7/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import XCTest
@testable import SwiftTicTacToe

class CoordinateTests: XCTestCase {
    
}

// MARK: Equality Tests
extension CoordinateTests {
    
    func testEquality_SameRowsSameColumns() {
        let coordinate1 = Coordinate(row: .Middle, column: .Middle)
        let coordinate2 = Coordinate(row: .Middle, column: .Middle)
        
        XCTAssertEqual(coordinate1, coordinate2)
    }
    
    func testEquality_SameRowsDifferentColumns() {
        let coordinate1 = Coordinate(row: .Middle, column: .Left)
        let coordinate2 = Coordinate(row: .Middle, column: .Right)
        
        XCTAssertNotEqual(coordinate1, coordinate2)
    }
    
    func testEquality_DifferentRowsSameColumns() {
        let coordinate1 = Coordinate(row: .Top, column: .Right)
        let coordinate2 = Coordinate(row: .Bottom, column: .Right)
        
        XCTAssertNotEqual(coordinate1, coordinate2)
    }
    
    func testEquality_DifferentRowsDifferentColumns() {
        let coordinate1 = Coordinate(row: .Top, column: .Right)
        let coordinate2 = Coordinate(row: .Bottom, column: .Middle)
        
        XCTAssertNotEqual(coordinate1, coordinate2)
    }
}
