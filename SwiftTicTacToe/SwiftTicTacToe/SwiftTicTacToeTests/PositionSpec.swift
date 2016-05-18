//
//  PositionSpec.swift
//  SwiftTicTacToe
//
//  Created by Natasha Murashev on 1/7/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftTicTacToe

class PositionSpec: QuickSpec {
    
    override func spec() {
        describe("equality") {
            context("when the position coordinates and state are the same") {
                it("the positions are equal") {
                    let coordinate = Coordinate(row: .Middle, column: .Left)
                    let position1 = Position(coordinate: coordinate, state: .Empty)
                    let position2 = Position(coordinate: coordinate, state: .Empty)
                    expect(position1) == position2
                }
            }
            context("when the position coordinates and state are different") {
                it("the positions are NOT equal") {
                    let coordinate1 = Coordinate(row: .Middle, column: .Left)
                    let coordinate2 = Coordinate(row: .Top, column: .Right)
                    
                    let position1 = Position(coordinate: coordinate1, state: .Empty)
                    let position2 = Position(coordinate: coordinate2, state: .X)
                    expect(position1) != position2
                }
            }
            context("when the position coordinates are different, but state is the same") {
                it("the positions are NOT equal") {
                    let coordinate1 = Coordinate(row: .Middle, column: .Left)
                    let coordinate2 = Coordinate(row: .Top, column: .Right)
                    
                    let position1 = Position(coordinate: coordinate1, state: .Empty)
                    let position2 = Position(coordinate: coordinate2, state: .Empty)
                    expect(position1) != position2
                }
            }
            context("when the position coordinates are the same, but state is the different") {
                it("the positions are NOT equal") {
                    let coordinate = Coordinate(row: .Middle, column: .Left)
                    
                    let position1 = Position(coordinate: coordinate, state: .O)
                    let position2 = Position(coordinate: coordinate, state: .X)
                    expect(position1) != position2
                }
            }
        }
    }
    
}
