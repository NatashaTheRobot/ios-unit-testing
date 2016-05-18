//
//  Board.swift
//  SwiftTicTacToe
//
//  Created by Natasha Murashev on 1/3/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//


struct Board {
    
    private let positionsMatrix: [[Position]]
    let positions: [Position]
    
    init() {
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
                let position = Position(coordinate: coordinate, state: .Empty)
                rowPositions.append(position)
            }
            positionsMatrix.append(rowPositions)
        }
        self.positionsMatrix = positionsMatrix
        positions = positionsMatrix.flatMap { return $0 }
    }
    
    // dependency injection
    init(positionsMatrix: [[Position]]) {
        self.positionsMatrix = positionsMatrix
        positions = positionsMatrix.flatMap { return $0 }
    }
    
    subscript(coordinate: Coordinate) -> Position {
        get {
            return positionsMatrix[coordinate.row.rawValue][coordinate.column.rawValue]
        }
    }
    
    var containsEmptyPositions: Bool {
        let emptyPositions = positions.filter { $0.state == .Empty }
        return emptyPositions.count > 0
    }
    
    func boardWithNewPosition(position: Position) -> Board {
        var positions = positionsMatrix
        let row = position.coordinate.row.rawValue
        let column = position.coordinate.column.rawValue
        positions[row][column] = position
        return Board(positionsMatrix: positions)
    }
}


