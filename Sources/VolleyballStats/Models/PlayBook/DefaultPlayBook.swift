//
//  DefaultPlayBook.swift
//
//
//  Created by Jose Manuel Ortiz Sanchez on 19/10/23.
//

import Foundation

// TODO: Completar el resto de "options"
struct DefaultPlayBook: PlayBookProtocol {
    
    var options: [PlayOption]
    
    init() {
        self.options = [
            .init(type: .serve, successPercentage: 0, description: "Direct serve failure", sign: "="),
            .init(type: .serve, successPercentage: 20, description: "Simple serve, the opponent has all the attack options", sign: "-"),
            .init(type: .serve, successPercentage: 50, description: "After the serve, the opponent can only attack from the wings", sign: "+"),
            .init(type: .serve, successPercentage: 80, description: "They give us back a free ball", sign: "++"),
            .init(type: .serve, successPercentage: 100, description: "Direct serve point", sign: "#")
        ]
    }
    
    func getOptions() -> [PlayOption] {
        return options
    }
    
    func generatePlay(option: PlayOption, position: CGPoint) -> Play {
        Play(
            type: option.type,
            success: option.successPercentage,
            position: position
        )
    }
}
