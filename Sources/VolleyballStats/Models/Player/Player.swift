//
//  Player.swift
//  
//
//  Created by Jose Manuel Ortiz Sanchez on 18/10/23.
//

import Foundation

/// Representation of a volleyball player
public struct Player: Identifiable, Hashable, Equatable {
    /// unique identifier
    public var id: String
    /// type of player: setter, hitter, libero...
    public var type: PlayerType
    /// player number, shirt number...
    public var number: Int
    /// player name
    public var name: String
    
    public init(
        id: String,
        type: PlayerType,
        number: Int,
        name: String
    ) {
        self.id = id
        self.type = type
        self.number = number
        self.name = name
    }
    
    public init(
        type: PlayerType,
        number: Int,
        name: String
    ) {
        self.id = UUID().uuidString
        self.type = type
        self.number = number
        self.name = name
    }
    
    /// Player initials, e.g. Alberto Ortiz = AO
    public var initials: String {
        let components = name.split(separator: " ")
        return components.map { String($0.prefix(1)) }.joined()
    }
}
