//
//  PlayerTests.swift
//  
//
//  Created by Jose Manuel Ortiz Sanchez on 18/10/23.
//

import XCTest
import VolleyballStats

final class PlayerTests: XCTestCase {

    func testPlayerInitializationWithID() {
        let player = Player(id: "1", type: .setter, number: 11, name: "Pepe Ortiz")
        XCTAssertEqual(player.id, "1")
        XCTAssertEqual(player.type, .setter)
        XCTAssertEqual(player.number, 11)
        XCTAssertEqual(player.name, "Pepe Ortiz")
    }
    
    func testPlayerInitializationWithoutID() {
        let player = Player(type: .outsideHitter, number: 2, name: "Fran Pérez")
        XCTAssertNotNil(player.id)
        XCTAssertEqual(player.type, .outsideHitter)
        XCTAssertEqual(player.number, 2)
        XCTAssertEqual(player.name, "Fran Pérez")
    }
    
    func testPlayerInitials() {
        let player1 = Player(type: .middleHitter, number: 7, name: "Paz García")
        XCTAssertEqual(player1.initials, "PG")
        
        let player2 = Player(type: .libero, number: 4, name: "Alberto Ortiz Sánchez")
        XCTAssertEqual(player2.initials, "AOS")
    }
    
    func testPlayerTypeSpanish() {
        XCTAssertEqual(PlayerType.outsideHitter.spanishType, "Receptor")
        XCTAssertEqual(PlayerType.middleHitter.spanishType, "Central")
        XCTAssertEqual(PlayerType.oppositeHitter.spanishType, "Opuesto")
        XCTAssertEqual(PlayerType.setter.spanishType, "Colocador")
        XCTAssertEqual(PlayerType.libero.spanishType, "Líbero")
    }

    func testEquality() {
        let player = Player(id: "1", type: .setter, number: 11, name: "Pepe Ortiz")
        let player2 = Player(id: player.id, type: player.type, number: player.number, name: player.name)
        XCTAssertEqual(player, player2)
    }
    
    func testInequality() {
        let player = Player(id: "1", type: .setter, number: 11, name: "Pepe Ortiz")
        let player2 = Player(type: player.type, number: player.number, name: player.name)
        XCTAssertNotEqual(player, player2)
    }
    
    func testAllPlayerTypesArePresent() {
        XCTAssertEqual(PlayerType.allCases.count, 5)
        XCTAssertTrue(PlayerType.allCases.contains(.outsideHitter))
        XCTAssertTrue(PlayerType.allCases.contains(.middleHitter))
        XCTAssertTrue(PlayerType.allCases.contains(.oppositeHitter))
        XCTAssertTrue(PlayerType.allCases.contains(.setter))
        XCTAssertTrue(PlayerType.allCases.contains(.libero))
    }
}
