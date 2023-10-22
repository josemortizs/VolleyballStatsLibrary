//
//  DefaultPlayBookTests.swift
//  
//
//  Created by Jose Manuel Ortiz Sanchez on 19/10/23.
//

import XCTest
import VolleyballStats

final class DefaultPlayBookTests: XCTestCase {

    func testNoDuplicateOptions() {
        let defaultPlayBook = DefaultPlayBook()
        let options = defaultPlayBook.getOptions()
        
        var seenOptions: [String: Set<String>] = [:]
        
        for option in options {
            let type = option.type.rawValue
            let sign = option.sign
            
            if let seenSigns = seenOptions[type], seenSigns.contains(sign) {
                XCTFail("Duplicate found: type '\(type)', sign '\(sign)'")
            } else {
                if seenOptions[type] == nil {
                    seenOptions[type] = Set()
                }
                seenOptions[type]?.insert(sign)
            }
        }
    }
    
    func testOptionsNotEmpty() {
        let defaultPlayBook = DefaultPlayBook()
        let options = defaultPlayBook.getOptions()
        
        XCTAssertFalse(options.isEmpty, "The options array must not be empty")
    }
}
