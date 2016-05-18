//
//  BoardTests.swift
//  SwiftTicTacToe
//
//  Created by Natasha Murashev on 1/3/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import XCTest
@testable import SwiftTicTacToe

class BoardTests: XCTestCase {
    
    func testBoardInitializationAllEmpty() {
        let board = Board()
        for rowIndex in 0..<3 {
            guard let row = Coordinate.Row(rawValue: rowIndex) else {
                XCTFail("Row must be valid!")
                return
            }
            for columnIndex in 0..<3 {
                guard let column = Coordinate.Column(rawValue: columnIndex) else {
                    XCTFail("Column must be valid!")
                    return
                }
                let coordinate = Coordinate(row: row, column: column)
                let position = board[coordinate]
                XCTAssertEqual(position.state, Position.State.Empty)
            }
        }
    }
    
    func testBoardWithNewPosition() {
        let board = Board()
        let coordinate = Coordinate(row: .Middle, column: .Middle)
        
        let initialPosition = board[coordinate]
        XCTAssertEqual(initialPosition.state, Position.State.Empty)
        
        let newPosition = Position(coordinate: coordinate, state: .X)
        let newBoard = board.boardWithNewPosition(newPosition)
        XCTAssertEqual(newBoard[coordinate], newPosition)
    }
    
}

// MARK: .containsEmptyPositions Tests
extension BoardTests {
    
    func testContainsEmptyPositions_EmptyBoard() {
        let board = Board()
        XCTAssertTrue(board.containsEmptyPositions)
    }
    
    func testContainsEmptyPositions_FullBoard() {
        XCTAssertFalse(fullBoard.containsEmptyPositions)
    }
}

private extension BoardTests {
    
    var fullBoard: Board {
        var positionsMatrix = [[Position]]()
        for rowIndex in 0..<3 {
            var rowPositions = [Position]()
            guard let row = Coordinate.Row(rawValue: rowIndex) else {
                fatalError("Row must be valid")
            }
            for columnIndex in 0..<3 {
                guard let column = Coordinate.Column(rawValue: columnIndex) else {
                    fatalError("Column must be valid")
                }
                let coordinate = Coordinate(row: row, column: column)
                let position = Position(coordinate: coordinate, state: .X)
                rowPositions.append(position)
            }
            positionsMatrix.append(rowPositions)
        }
        return Board(positionsMatrix: positionsMatrix)
    }
}
