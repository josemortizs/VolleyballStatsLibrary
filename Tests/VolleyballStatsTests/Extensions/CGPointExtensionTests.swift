//
//  CGPointExtensionTests.swift
//  
//
//  Created by Jose Manuel Ortiz Sanchez on 19/10/23.
//

import XCTest

final class CGPointExtensionTests: XCTestCase {
    
    func testEquality() {
        let point1 = CGPoint(x: 1.0, y: 2.0)
        let point2 = CGPoint(x: 1.0, y: 2.0)
        let point3 = CGPoint(x: 3.0, y: 4.0)
        
        XCTAssertTrue(point1 == point2, "Equal points should be considered equal")
        XCTAssertFalse(point1 == point3, "Different points should not be considered equal")
    }
    
    func testHashing() {
        let point1 = CGPoint(x: 1.0, y: 2.0)
        let point2 = CGPoint(x: 1.0, y: 2.0)
        let point3 = CGPoint(x: 3.0, y: 4.0)
        
        XCTAssertEqual(point1.hashValue, point2.hashValue, "Equal points should have the same hash value")
        XCTAssertNotEqual(point1.hashValue, point3.hashValue, "Different points should have different hash values")
    }
}
