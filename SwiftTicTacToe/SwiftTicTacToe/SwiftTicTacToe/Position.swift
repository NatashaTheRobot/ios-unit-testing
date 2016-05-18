//
//  Position.swift
//  SwiftTicTacToe
//
//  Created by Natasha Murashev on 1/1/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

struct Position {
    let coordinate: Coordinate
    let state: State
    
    enum State: Int {
        case X, O, Empty
    }
}

extension Position: Equatable {}

func ==(lhs: Position, rhs: Position) -> Bool {
    return lhs.coordinate == rhs.coordinate &&
    lhs.state == rhs.state
}