//
//  Coordinate.swift
//  SwiftTicTacToe
//
//  Created by Natasha Murashev on 1/7/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

struct Coordinate {
    let row: Coordinate.Row
    let column: Coordinate.Column
    
    enum Row: Int {
        case Top, Middle, Bottom
    }
    
    enum Column: Int {
        case Right, Middle, Left
    }
}

extension Coordinate: Equatable {}

func ==(lhs: Coordinate, rhs: Coordinate) -> Bool {
    return lhs.row == rhs.row &&
        lhs.column == rhs.column
}