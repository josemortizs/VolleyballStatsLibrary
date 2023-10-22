//
//  DefaultPlayBook.swift
//
//
//  Created by Jose Manuel Ortiz Sanchez on 19/10/23.
//

import Foundation

// TODO: Implementar opciones de colocación
public struct DefaultPlayBook: PlayBookProtocol {
    
    private var options: [PlayOption]
    
    public init() {
        self.options = [
            .init(
                type: .serve,
                successPercentage: 0,
                description: "Direct serve failure",
                sign: "="),
            .init(
                type: .serve,
                successPercentage: 20,
                description: "Simple serve, the opponent has all the attack options",
                sign: "-"),
            .init(
                type: .serve,
                successPercentage: 50,
                description: "After the serve, the opponent can only attack from the wings",
                sign: "+"),
            .init(
                type: .serve, 
                successPercentage: 80,
                description: "They give us back a free ball",
                sign: "++"),
            .init(
                type: .serve,
                successPercentage: 100,
                description: "Direct serve point",
                sign: "#"),
            .init(
                type: .pass,
                successPercentage: 0,
                description: "The reception cannot be attacked, direct point for the rival team",
                sign: "="),
            .init(
                type: .pass,
                successPercentage: 20,
                description: "We can only attack from the points, without the possibility of attacking from the center",
                sign: "-"),
            .init(
                type: .pass,
                successPercentage: 40,
                description: "We return a free ball, we cannot attack",
                sign: "+"),
            .init(
                type: .pass,
                successPercentage: 75,
                description: "The reception is good, it allows us to play with the central attacker, although with difficulties",
                sign: "++"),
            .init(
                type: .pass,
                successPercentage: 100,
                description: "The reception is very good, we have all the attack options",
                sign: "#"),
            .init(
                type: .spike,
                successPercentage: 0,
                description: "Attack failed, outside, blocked or on the net, direct point for the other team",
                sign: "="),
            .init(
                type: .spike,
                successPercentage: 20,
                description: "Our attack is defended and they have the possibility to attack us",
                sign: "-"),
            .init(
                type: .spike,
                successPercentage: 40,
                description: "Our attack is defended and they have the possibility of attacking us, but only from the points",
                sign: "+"),
            .init(
                type: .spike,
                successPercentage: 75,
                description: "We attack and they defend us but they give us a free ball back",
                sign: "++"),
            .init(
                type: .spike,
                successPercentage: 100,
                description: "The reception is very good, we have all the attack options",
                sign: "#"),
            .init(
                type: .block,
                successPercentage: 0,
                description: "Our block causes a point for the rival team",
                sign: "="),
            .init(
                type: .block,
                successPercentage: 20,
                description: "We block the rival attack, but they still maintain the option of the next attack",
                sign: "-"),
            .init(
                type: .block,
                successPercentage: 40,
                description: "We block the rival attack and we have the possibility of the next attack, but only with lateral attackers",
                sign: "+"),
            .init(
                type: .block,
                successPercentage: 80,
                description: "We block the rival attack and we have the possibility of the next attack with all the available options",
                sign: "++"),
            .init(
                type: .block,
                successPercentage: 100,
                description: "Direct point on block",
                sign: "#"),
            .init(
                type: .dig,
                successPercentage: 0,
                description: "Direct point of the rival team on our defense zone",
                sign: "="),
            .init(
                type: .dig,
                successPercentage: 20,
                description: "We defend his attack, but he forces us to return a freeball",
                sign: "-"),
            .init(
                type: .dig,
                successPercentage: 50,
                description: "We defend their attack, but they have the next attack, although only through the lateral attackers",
                sign: "+"),
            .init(
                type: .dig,
                successPercentage: 80,
                description: "We defend their attack and keep the ball so we can attack it, only through lateral attackers",
                sign: "++"),
            .init(
                type: .dig,
                successPercentage: 100,
                description: "We defend their attack and keep the ball in play, being able to attack it with all available options",
                sign: "#")
        ]
    }
    
    public func getOptions() -> [PlayOption] { options }
}
