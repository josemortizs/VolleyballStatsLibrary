//
//  Game.swift
//
//
//  Created by Jose Manuel Ortiz Sanchez on 21/10/23.
//

import Foundation

// TODO: Implementar struct para Teams
struct Game {
    var date: Date
    var players: [Player]
    var plays: [Play]
    var playbook: PlayBookProtocol
}
