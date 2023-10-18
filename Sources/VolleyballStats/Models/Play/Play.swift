//
//  Play.swift
//
//
//  Created by Jose Manuel Ortiz Sanchez on 18/10/23.
//

import Foundation

/// Representation of a play, a point, in volleyball
public struct Play: Identifiable, Hashable, Comparable, Equatable {

    /// unique identifier
    public var id: String
    /// type of play: pass, spike, block...
    public var type: PlayType
    /// success percentage: between 0 - 100
    public var success: Int
    /// position at the time of the play
    public var position: CGPoint
    
    public init(
        id: String,
        type: PlayType,
        success: Int,
        position: CGPoint
    ) {
        self.id = id
        self.type = type
        self.success = success
        self.position = position
    }
    
    public init(
        type: PlayType,
        success: Int,
        position: CGPoint
    ) {
        self.id = UUID().uuidString
        self.type = type
        self.success = success
        self.position = position
    }
        
    public static func < (lhs: Play, rhs: Play) -> Bool {
        lhs.success < rhs.success
    }
    
    public static func == (lhs: Play, rhs: Play) -> Bool {
        lhs.id == rhs.id && lhs.position == rhs.position
    }
}
