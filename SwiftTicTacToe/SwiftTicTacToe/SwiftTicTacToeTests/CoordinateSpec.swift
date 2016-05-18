//
//  CoordinateSpec.swift
//  SwiftTicTacToe
//
//  Created by Natasha Murashev on 1/7/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftTicTacToe

class CoordinateSpec: QuickSpec {
    
    override func spec() {
        describe("equality") {
            context("when both the rows and the columns are the same") {
                it("the coordinates are equal") {
                    let coordinate1 = Coordinate(row: .Middle, column: .Middle)
                    let coordinate2 = Coordinate(row: .Middle, column: .Middle)
                    expect(coordinate1) == coordinate2
                }
            }
            context("when the rows are the same, but the columns are different") {
                it("the coordinates are NOT equal") {
                    let coordinate1 = Coordinate(row: .Middle, column: .Left)
                    let coordinate2 = Coordinate(row: .Middle, column: .Right)
                    expect(coordinate1) != coordinate2
                }
            }
            context("when the rows are different, but the columns are the same") {
                it("the coordinates are NOT equal") {
                    let coordinate1 = Coordinate(row: .Top, column: .Right)
                    let coordinate2 = Coordinate(row: .Bottom, column: .Right)
                    expect(coordinate1) != coordinate2
                }
            }
            context("when both rows and the columns are different") {
                it("the coordinates are NOT equal") {
                    let coordinate1 = Coordinate(row: .Top, column: .Right)
                    let coordinate2 = Coordinate(row: .Bottom, column: .Middle)
                    expect(coordinate1) != coordinate2
                }
            }
        }
    }
    
}
