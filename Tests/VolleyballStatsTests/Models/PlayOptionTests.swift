//
//  PlayOptionTests.swift
//  
//
//  Created by Jose Manuel Ortiz Sanchez on 18/10/23.
//

import XCTest
import VolleyballStats

final class PlayOptionTests: XCTestCase {

    func testInitializationWithId() {
        let playOption = PlayOption(
            id: "123",
            type: .serve,
            successPercentage: 0,
            description: "Direct serve failure",
            sign: "--"
        )
        
        XCTAssertEqual(playOption.id, "123")
        XCTAssertEqual(playOption.type, .serve)
        XCTAssertEqual(playOption.successPercentage, 0)
        XCTAssertEqual(playOption.description, "Direct serve failure")
        XCTAssertEqual(playOption.sign, "--")
    }
    
    func testInitializationWithoutId() {
        let playOption = PlayOption(
            type: .serve,
            successPercentage: 100,
            description: "Direct serve point",
            sign: "++"
        )
        
        XCTAssertFalse(playOption.id.isEmpty)
        XCTAssertEqual(playOption.type, .serve)
        XCTAssertEqual(playOption.successPercentage, 100)
        XCTAssertEqual(playOption.description, "Direct serve point")
        XCTAssertEqual(playOption.sign, "++")
    }
    
    func testComparison() {
        let playOption1 = PlayOption(id: "123", type: .serve, successPercentage: 80, description: "They give us the ball back without attacking", sign: "+")
        let playOption2 = PlayOption(id: "456", type: .serve, successPercentage: 40, description: "They can only attack from the wings, without a central attack", sign: ":")
        
        XCTAssertTrue(playOption1 > playOption2)
        XCTAssertFalse(playOption2 > playOption1)
    }
}
