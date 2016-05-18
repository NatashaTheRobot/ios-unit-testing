//
//  PostionTests.swift
//  SwiftTicTacToe
//
//  Created by Natasha Murashev on 1/7/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import XCTest
@testable import SwiftTicTacToe

class PositionTests: XCTestCase {
    
}

// MARK: Equality Tests
extension PositionTests {
    
    func testEquality_SameCoordinatesSameState() {
        let coordinate = Coordinate(row: .Middle, column: .Left)
        let position1 = Position(coordinate: coordinate, state: .Empty)
        let position2 = Position(coordinate: coordinate, state: .Empty)
        
        XCTAssertEqual(position1, position2)
    }
    
    func testEquality_DifferentCoordinatesDifferentState() {
        let coordinate1 = Coordinate(row: .Middle, column: .Left)
        let coordinate2 = Coordinate(row: .Top, column: .Right)
        
        let position1 = Position(coordinate: coordinate1, state: .Empty)
        let position2 = Position(coordinate: coordinate2, state: .X)
        
        XCTAssertNotEqual(position1, position2)
    }
    
    func testEquality_DifferentCoordinatesSameState() {
        let coordinate1 = Coordinate(row: .Middle, column: .Left)
        let coordinate2 = Coordinate(row: .Top, column: .Right)
        
        let position1 = Position(coordinate: coordinate1, state: .Empty)
        let position2 = Position(coordinate: coordinate2, state: .Empty)
        
        XCTAssertNotEqual(position1, position2)
    }
    
    func testEquality_SameCoordinatesDifferentState() {
        let coordinate = Coordinate(row: .Middle, column: .Left)
        
        let position1 = Position(coordinate: coordinate, state: .O)
        let position2 = Position(coordinate: coordinate, state: .X)
        
        XCTAssertNotEqual(position1, position2)
    }
}
