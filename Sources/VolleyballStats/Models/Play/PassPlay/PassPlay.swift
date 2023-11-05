//
//  PassPlay.swift
//
//
//  Created by Jose Manuel Ortiz Sanchez on 5/11/23.
//

import Foundation

/// Representation of a reception, in Volleyball, with its different alternatives and the rival serve
public struct PassPlay: Identifiable, Hashable, Comparable, Equatable, CustomStringConvertible {
    
    /// unique identifier
    public var id: String
    /// play associated
    public var play: Play
    /// origin position of the serve, from 1 to 9, normally 1
    public var originServe: Int
    /// serve type
    public var serveType: ServeType
    /// pass type
    public var passType: PassType
    
    public var description: String {
        play.description
    }
    
    public init(
        id: String,
        play: Play,
        originServe: Int,
        serveType: ServeType,
        passType: PassType
    ) {
        self.id = id
        self.play = play
        self.originServe = originServe
        self.serveType = serveType
        self.passType = passType
    }
    
    public init(
        play: Play,
        originServe: Int,
        serveType: ServeType,
        passType: PassType
    ) {
        self.id = UUID().uuidString
        self.play = play
        self.originServe = originServe
        self.serveType = serveType
        self.passType = passType
    }
    
    public static func == (lhs: PassPlay, rhs: PassPlay) -> Bool {
        lhs.id == rhs.id && lhs.play == rhs.play
    }
    
    public static func < (lhs: PassPlay, rhs: PassPlay) -> Bool {
        lhs.play < rhs.play
    }
}
