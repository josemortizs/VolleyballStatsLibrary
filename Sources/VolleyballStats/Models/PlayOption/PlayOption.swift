//
//  PlayOption.swift
//
//
//  Created by Jose Manuel Ortiz Sanchez on 18/10/23.
//

import Foundation

public struct PlayOption: Identifiable, Hashable, Comparable, Equatable {

    /// unique identifier
    public var id: String
    /// type of play: pass, spike, block...
    public var type: PlayType
    /// success percentage: between 0 - 100
    public var successPercentage: Int
    /// option description
    public var description: String
    /// sign representing option
    public var sign: String
    
    public init(
        id: String,
        type: PlayType,
        successPercentage: Int,
        description: String,
        sign: String
    ) {
        self.id = id
        self.type = type
        self.successPercentage = successPercentage
        self.description = description
        self.sign = sign
    }
    
    public init(
        type: PlayType,
        successPercentage: Int,
        description: String,
        sign: String
    ) {
        self.id = UUID().uuidString
        self.type = type
        self.successPercentage = successPercentage
        self.description = description
        self.sign = sign
    }
    
    public static func < (lhs: PlayOption, rhs: PlayOption) -> Bool {
        lhs.successPercentage < rhs.successPercentage
    }
}
