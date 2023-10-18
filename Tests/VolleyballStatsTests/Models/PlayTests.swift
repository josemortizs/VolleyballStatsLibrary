//
//  PlayTests.swift
//  
//
//  Created by Jose Manuel Ortiz Sanchez on 18/10/23.
//

import XCTest
import VolleyballStats

final class PlayTests: XCTestCase {
    
    let play = Play(type: .serve, success: 80)

    func testEquality() {
        let play2 = Play(id: play.id, type: play.type, success: play.success)
        XCTAssertEqual(play, play2)
    }
    
    func testInequality() {
        let play2 = Play(type: play.type, success: play.success)
        XCTAssertNotEqual(play, play2)
    }
    
    func testComparison() {
        let play2 = Play(type: .spike, success: 90)
        XCTAssertGreaterThan(play2, play)
    }
    
    func testInitializationWithId() {
        let play = Play(id: "1", type: .block, success: 70)
        XCTAssertEqual(play.id, "1")
        XCTAssertEqual(play.type, .block)
        XCTAssertEqual(play.success, 70)
    }

    func testInitializationWithoutId() {
        let play = Play(type: .pass, success: 85)
        XCTAssertNotNil(play.id)
        XCTAssertEqual(play.type, .pass)
        XCTAssertEqual(play.success, 85)
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
}
