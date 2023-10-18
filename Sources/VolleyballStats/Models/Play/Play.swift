//
//  Play.swift
//
//
//  Created by Jose Manuel Ortiz Sanchez on 18/10/23.
//

import Foundation

/// Enumeration representing types of volleyball actions.
public enum PlayType: String {
    case serve = "SERVE"
    case pass = "PASS"
    case set = "SET"
    case spike = "SPIKE"
    case block = "BLOCK"
    case dig = "DIG"
}

/// Representation of a play, a point, in volleyball
public struct Play: Identifiable, Hashable, Comparable, Equatable {
    /// unique identifier
    public var id: String
    /// type of play: pass, spike, block...
    public var type: PlayType
    /// success percentage: between 0 - 100
    public var success: Int
    
    public init(
        id: String,
        type: PlayType,
        success: Int
    ) {
        self.id = id
        self.type = type
        self.success = success
    }
    
    public init(
        type: PlayType,
        success: Int
    ) {
        self.id = UUID().uuidString
        self.type = type
        self.success = success
    }
        
    public static func < (lhs: Play, rhs: Play) -> Bool {
        lhs.success < rhs.success
    }
}
