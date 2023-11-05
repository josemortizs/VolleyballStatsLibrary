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
    
    func testPassPlaySecondInitializer() {
        let play = Play(id: "1", type: .spike, success: 70, position: CGPoint(x: 3.0, y: 4.0))
        let passPlay = PassPlay(play: play, originServe: 2, serveType: .highHand, passType: .forearmsRight)
        
        XCTAssertFalse(passPlay.id.isEmpty)

        XCTAssertEqual(passPlay.play, play)
        XCTAssertEqual(passPlay.originServe, 2)
        XCTAssertEqual(passPlay.serveType, .highHand)
        XCTAssertEqual(passPlay.passType, .forearmsRight)
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
    
    func testPassTypeSpanish() {
        XCTAssertEqual(PassType.forearmsCenter.spanishType, "Centrada, de antebrazos")
        XCTAssertEqual(PassType.forearmsDown.spanishType, "De antebrazos, baja")
        XCTAssertEqual(PassType.forearmsRight.spanishType, "De antebrazos, sobre la derecha")
        XCTAssertEqual(PassType.forearmsLeft.spanishType, "De antebrazos, sobre la izquierda")
        XCTAssertEqual(PassType.highHand.spanishType, "De mano alta")
    }
    
    func testServeTypeSpanish() {
        XCTAssertEqual(ServeType.lowHand.spanishType, "Saque de mano baja")
        XCTAssertEqual(ServeType.highHand.spanishType, "Saque de mano alta")
        XCTAssertEqual(ServeType.floating.spanishType, "Saque flotante")
        XCTAssertEqual(ServeType.floatingInJump.spanishType, "Saque flotante en salto")
        XCTAssertEqual(ServeType.power.spanishType, "Saque en potencia")
        XCTAssertEqual(ServeType.powerInJump.spanishType, "Saque en potencia en salto")
    }
}
