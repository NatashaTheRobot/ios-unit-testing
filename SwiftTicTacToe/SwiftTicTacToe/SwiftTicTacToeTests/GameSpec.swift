//
//  TicTacToeBoardSpec.swift
//  SwiftTicTacToe
//
//  Created by Natasha Murashev on 1/1/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftTicTacToe

class GameSpec: QuickSpec {
    
    override func spec() {
        describe(".gameState") {
            context("when the game has not ended") {
                
                let emptyBoard = Board()
                var game = Game()
                game.board = emptyBoard
                
                it("the game state is not ended") {
                    expect(game.gameState) == Game.GameState.NotEnded
                }
            }
            
            context("when X wins") {
                
                let xWinsBoard = BoardFactory.fullBoard(withState: .X)
                var game = Game()
                game.board = xWinsBoard
                
                it("the game state is X wins") {
                    expect(game.gameState) == Game.GameState.XWins
                }
            }
            
            context("when O wins") {
                
                let oWinsBoard = BoardFactory.fullBoard(withState: .O)
                var game = Game()
                game.board = oWinsBoard
                
                it("the game state is Y wins") {
                    expect(game.gameState) == Game.GameState.OWins
                }
            }
            
            context("when it's a tie") {
                
            }
        }
    }
}

struct BoardFactory {
    // TODO: Extract into Board Helper Functions!
    static func fullBoard(withState state: Position.State) -> Board {
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
                let position = Position(coordinate: coordinate, state: state)
                rowPositions.append(position)
            }
            positionsMatrix.append(rowPositions)
        }
        return Board(positionsMatrix: positionsMatrix)
    }
}
