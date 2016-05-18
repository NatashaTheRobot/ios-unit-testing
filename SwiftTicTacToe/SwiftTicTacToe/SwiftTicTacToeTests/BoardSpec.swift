//
//  BoardSpec.swift
//  SwiftTicTacToe
//
//  Created by Natasha Murashev on 1/3/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftTicTacToe

class BoardSpec: QuickSpec {
    
    override func spec() {
        
        describe("init") {
            let board = Board()
            
            it("the board is empty") {
                for rowIndex in 0..<3 {
                    guard let row = Coordinate.Row(rawValue: rowIndex) else {
                        XCTFail("Row must be valid!")
                        return
                    }
                    for columnIndex in 0..<3 {
                        guard let column = Coordinate.Column(rawValue: columnIndex) else {
                            fail("Column must be valid!")
                            return
                        }
                        let coordinate = Coordinate(row: row, column: column)
                        let position = board[coordinate]
                        expect(position.state) == Position.State.Empty
                    }
                }
            }
        }
        
        describe(".containsEmptyPositions") {
            context("when the board has empty positions") {
                let board = Board()
                it("is true") {
                    expect(board.containsEmptyPositions).to(beTrue())
                }
            }
            
            context("when the board has no empty postions") {
                it("is false") {
                    expect(self.fullBoard.containsEmptyPositions).to(beFalse())
                }
            }
        }
        
        describe(".boardWithNewPosition") {
            let board = Board()
            it("returns a board with the new position") {
                let coordinate = Coordinate(row: .Middle, column: .Middle)
                
                let initialPosition = board[coordinate]
                expect(initialPosition.state) == Position.State.Empty
                
                let newPosition = Position(coordinate: coordinate, state: .X)
                let newBoard = board.boardWithNewPosition(newPosition)
                expect(newBoard[coordinate]) == newPosition
            }
        }
    }
}

private extension BoardSpec {
    
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
