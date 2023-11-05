//
//  PassPlayTests.swift
//  
//
//  Created by Jose Manuel Ortiz Sanchez on 5/11/23.
//

import XCTest
import VolleyballStats

final class PassPlayTests: XCTestCase {

    func testPassPlayInitialization() {
        let play = Play(id: "1", type: .serve, success: 80, position: CGPoint(x: 1.0, y: 2.0))
        let passPlay = PassPlay(id: "1", play: play, originServe: 1, serveType: .lowHand, passType: .forearmsCenter)
        
        XCTAssertEqual(passPlay.id, "1")
        XCTAssertEqual(passPlay.play, play)
        XCTAssertEqual(passPlay.originServe, 1)
        XCTAssertEqual(passPlay.serveType, .lowHand)
        XCTAssertEqual(passPlay.passType, .forearmsCenter)
    }
    
    func testPassPlayEquality() {
        let play1 = Play(id: "1", type: .serve, success: 80, position: CGPoint(x: 1.0, y: 2.0))
        let passPlay1 = PassPlay(id: "1", play: play1, originServe: 1, serveType: .lowHand, passType: .forearmsCenter)
        
        let play2 = Play(id: "2", type: .spike, success: 60, position: CGPoint(x: 3.0, y: 4.0))
        let passPlay2 = PassPlay(id: "2", play: play2, originServe: 2, serveType: .highHand, passType: .forearmsRight)
        
        let play3 = Play(id: "1", type: .serve, success: 80, position: CGPoint(x: 1.0, y: 2.0))
        let passPlay3 = PassPlay(id: "1", play: play3, originServe: 1, serveType: .lowHand, passType: .forearmsCenter)
        
        XCTAssertEqual(passPlay1, passPlay3)
        XCTAssertNotEqual(passPlay1, passPlay2)
    }
    
    func testPassPlayComparison() {
        let play1 = Play(id: "1", type: .serve, success: 80, position: CGPoint(x: 1.0, y: 2.0))
        let passPlay1 = PassPlay(id: "1", play: play1, originServe: 1, serveType: .lowHand, passType: .forearmsCenter)
        
        let play2 = Play(id: "2", type: .spike, success: 60, position: CGPoint(x: 3.0, y: 4.0))
        let passPlay2 = PassPlay(id: "2", play: play2, originServe: 2, serveType: .highHand, passType: .forearmsRight)
        
        XCTAssertTrue(passPlay1 > passPlay2)
    }
    
    func testPassPlayDescription() {
        let play = Play(id: "1", type: .serve, success: 80, position: CGPoint(x: 1.0, y: 2.0))
        let passPlay = PassPlay(id: "1", play: play, originServe: 1, serveType: .lowHand, passType: .forearmsCenter)
        
        let expectedDescription = "Play: type -> SERVE - success -> 80"
        XCTAssertEqual(passPlay.description, expectedDescription)
    }
}
