//
//  Game.swift
//  SwiftTicTacToe
//
//  Created by Natasha Murashev on 1/1/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

/*
The board is:
0,0 | 0,1 | 0,2
1,0 | 1,1 | 1,2
2,0 | 2,1 | 2,2
*/

struct Game {
    
    var board = Board()
    
    enum GameState {
        case NotEnded, Tie, XWins, OWins
    }
    
    // Returns the state of the game: not ended, O wins, X wins, or tie.
    var gameState: GameState {
        
        if board.containsEmptyPositions {
            return .NotEnded
        }
        
        for winningCombination in WinningCombinations.allCombinations {
            let winningCoordinates = winningCombination.coordinates
            let positionStates = winningCoordinates.map { board[$0].state }
            
            if positionStates.allEqual() {
                let state = positionStates[0]
                switch state {
                case .X:
                    return .XWins
                case .O:
                    return .OWins
                default:
                    continue
                }
            }
        }
        
        return .Tie
    }
    
    // Attempts to play in the position.
    mutating func playPosition(position: Position, toState state: Position.State) {
        if position.state == .Empty {
            let newPosition = Position(coordinate: position.coordinate, state: state)
            board = board.boardWithNewPosition(newPosition)
        }
    }
}

private extension Game {
    
    enum WinningCombinations {
        case TopRow, MiddleRow, BottomRow
        case LeftColumn, MiddleColumn, RightColumn
        case DiagonalRight, DiagonalLeft
        
        static let allCombinations: Set = [WinningCombinations.TopRow, WinningCombinations.MiddleRow, WinningCombinations.BottomRow, WinningCombinations.LeftColumn, WinningCombinations.MiddleColumn, WinningCombinations.RightColumn, WinningCombinations.DiagonalRight, WinningCombinations.DiagonalLeft]
        
        var coordinates: [Coordinate] {
            switch self {
            case .TopRow:
                return [Coordinate(row: .Top, column: .Right), Coordinate(row: .Top, column: .Middle), Coordinate(row: .Top, column: .Left)]
            case .MiddleRow:
                return [Coordinate(row: .Middle, column: .Right), Coordinate(row: .Middle, column: .Middle), Coordinate(row: .Middle, column: .Left)]
            case .BottomRow:
                return [Coordinate(row: .Bottom, column: .Right), Coordinate(row: .Middle, column: .Middle), Coordinate(row: .Middle, column: .Left)]
            case .LeftColumn:
                return [Coordinate(row: .Top, column: .Left), Coordinate(row: .Middle, column: .Left), Coordinate(row: .Bottom, column: .Left)]
            case .MiddleColumn:
                return [Coordinate(row: .Top, column: .Middle), Coordinate(row: .Middle, column: .Middle), Coordinate(row: .Bottom, column: .Middle)]
            case .RightColumn:
                return [Coordinate(row: .Top, column: .Right), Coordinate(row: .Middle, column: .Right), Coordinate(row: .Bottom, column: .Right)]
            case .DiagonalRight:
                return [Coordinate(row: .Top, column: .Right), Coordinate(row: .Middle, column: .Middle), Coordinate(row: .Bottom, column: .Left)]
            case .DiagonalLeft:
                return [Coordinate(row: .Top, column: .Left), Coordinate(row: .Middle, column: .Middle), Coordinate(row: .Bottom, column: .Right)]
            }
        }
    }
}

extension Array where Element : Equatable {
    func allEqual() -> Bool {
        if let firstElem = first {
            return !dropFirst().contains { $0 != firstElem }
        }
        return true
    }
}