//
//  PlayTests.swift
//  
//
//  Created by Jose Manuel Ortiz Sanchez on 18/10/23.
//

import XCTest
import VolleyballStats

final class PlayTests: XCTestCase {
    
    let play = Play(type: .serve, success: 80, position: CGPoint(x: 0, y: 0))

    func testEquality() {
        let play2 = Play(id: play.id, type: play.type, success: play.successPercentage, position: play.position)
        XCTAssertEqual(play, play2)
    }
    
    func testInequality() {
        let play2 = Play(type: play.type, success: play.successPercentage, position: play.position)
        XCTAssertNotEqual(play, play2)
    }
    
    func testInequalityWithOtherPosition() {
        let play2 = Play(id: play.id, type: play.type, success: play.successPercentage, position: CGPoint(x: 1, y: 1))
        XCTAssertNotEqual(play, play2)
    }
    
    func testComparison() {
        let play2 = Play(type: .spike, success: 90, position: play.position)
        XCTAssertGreaterThan(play2, play)
    }
    
    func testInitializationWithId() {
        let play = Play(id: "1", type: .block, success: 70, position: CGPoint(x: 0, y: 0))
        XCTAssertEqual(play.id, "1")
        XCTAssertEqual(play.type, .block)
        XCTAssertEqual(play.successPercentage, 70)
        XCTAssertEqual(play.position, CGPoint(x: 0, y: 0))
    }

    func testInitializationWithoutId() {
        let play = Play(type: .pass, success: 85, position: CGPoint(x: 0, y: 0))
        XCTAssertNotNil(play.id)
        XCTAssertEqual(play.type, .pass)
        XCTAssertEqual(play.successPercentage, 85)
        XCTAssertEqual(play.position, CGPoint(x: 0, y: 0))
    }
    
    func testPlayTypeSpanish() {
        XCTAssertEqual(PlayType.serve.spanishType, "Saque")
        XCTAssertEqual(PlayType.pass.spanishType, "Recepción")
        XCTAssertEqual(PlayType.set.spanishType, "Colocación")
        XCTAssertEqual(PlayType.spike.spanishType, "Ataque")
        XCTAssertEqual(PlayType.block.spanishType, "Bloqueo")
        XCTAssertEqual(PlayType.dig.spanishType, "Defensa")
    }
    
    func testAllPlayTypesArePresent() {
        XCTAssertEqual(PlayType.allCases.count, 6)
        XCTAssertTrue(PlayType.allCases.contains(.serve))
        XCTAssertTrue(PlayType.allCases.contains(.pass))
        XCTAssertTrue(PlayType.allCases.contains(.set))
        XCTAssertTrue(PlayType.allCases.contains(.spike))
        XCTAssertTrue(PlayType.allCases.contains(.block))
        XCTAssertTrue(PlayType.allCases.contains(.dig))
    }
    
    func testDescription() {
        let play1 = Play(id: "1", type: .spike, success: 80, position: CGPoint(x: 10, y: 20))
        let play2 = Play(id: "2", type: .pass, success: 60, position: CGPoint(x: 5, y: 15))

        XCTAssertEqual(play1.description, "Play: type -> SPIKE - success -> 80")
        XCTAssertEqual(play2.description, "Play: type -> PASS - success -> 60")
    }
}
