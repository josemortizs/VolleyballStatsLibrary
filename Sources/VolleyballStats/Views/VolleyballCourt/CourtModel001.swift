//
//  CourtModel001.swift
//
//
//  Created by Jose Manuel Ortiz Sanchez on 21/10/23.
//

import SwiftUI
import Foundation

/*
    --------------------------------------------------------------------
    Proof of concept, just a playground of how we could use some
    of the components contained in the library to build a playing field.
    --------------------------------------------------------------------
 */

public struct CourtModel001<Player: PositionableProtocol>: View {
    
    @State private var playerWantToChangePosition: Bool = false
    @State private var playerSelected: Player?
    
    private let width: CGFloat
    private let height: CGFloat
    private let lineWidth: CGFloat
    private let players: [Player]
    private var onPlayerChangePosition: (Player, CGPoint) -> Void
    
    public init(size: CGSize,  players: [Player], onPlayerChangePosition: @escaping (Player, CGPoint) -> Void) {
        self.width = size.width / 9
        self.height = size.height / 9
        self.lineWidth = max(size.width, size.height) / 90
        self.players = players
        self.onPlayerChangePosition = onPlayerChangePosition
    }
    
    public var body: some View {
        ZStack(alignment: .center) {
            
            Color.customBlue.ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 0) {
                ForEach(1..<10) { row in
                    HStack(alignment: .center, spacing: 0) {
                        ForEach(1..<10) { column in
                            VStack(alignment: .center, spacing: 0) {
                                if playerWantToChangePosition {
                                    ZStack(alignment: .center) {
                                        Circle()
                                            .fill(Color.red)
                                            .frame(width: width * 0.8, height: height * 0.8)
                                        Text("\(column) - \(row)")
                                            .foregroundColor(.white)
                                    }
                                    .onTapGesture {
                                        changePositionSelectedPlayer(row: row, column: column)
                                    }
                                } else {
                                    let player = getPlayer(row: row, column: column)
                                    getPlayer(row: row, column: column)
                                        .onTapGesture(count: 2) {
                                            self.playerWantToChangePosition.toggle()
                                            self.playerSelected = player
                                        }
                                        .onLongPressGesture(
                                            minimumDuration: 1,
                                            maximumDistance: 10
                                        ) {
                                            self.playerWantToChangePosition.toggle()
                                            self.playerSelected = player
                                        }
                                }
                            }
                            .frame(width: width, height: height)
                            .frame(maxWidth: width, maxHeight: height)
                            .background(Color.customOrange)
                            .border(
                                width: lineWidth,
                                edges: [.bottom],
                                color: row == 3 ? .white : .clear
                            )
                        }
                    }
                }
            }
            .border(Color.white, width: lineWidth)
        }
    }
    
    @ViewBuilder private func getPlayer(row: Int, column: Int) -> Player? {
        players.first(where: { player in
            player.position.x.roundedToInt() == column && player.position.y.roundedToInt() == row
        })
    }
    
    private func changePositionSelectedPlayer(row: Int, column: Int) -> Void {
        guard let playerSelected = playerSelected else { return }
        onPlayerChangePosition(playerSelected, CGPoint(x: column, y: row))
        self.playerWantToChangePosition.toggle()
    }
}

#Preview {
    ExampleUse_CourtModel001()
}

struct ExampleUse_CourtModel001: View {
    
    @State var players: [ExamplePositionable] = [
        ExamplePositionable(position: CGPoint(x: 5, y: 7)),
        ExamplePositionable(position: CGPoint(x: 2, y: 3))
    ]
    
    var body: some View {
        VStack(alignment: .center) {
            CourtModel001(
                size: CGSize(width: 750, height: 750),
                players: players) { playerFromCourt, point in
                    
                    guard let index = players.firstIndex(where: { player in
                        player == playerFromCourt
                    }) else { return }
                                        
                    var temporalPlayer = playerFromCourt
                    temporalPlayer.position = point
                    players[index] = temporalPlayer
                }
        }
    }
}

public struct ExamplePositionable: PositionableProtocol, Equatable {
    
    public var position: CGPoint
    public var size: CGFloat
    
    public init(position: CGPoint) {
        self.position = position
        self.size = 60
    }
    
    public var body: some View {
        ZStack {
            Circle()
                .fill(Color.blue)
                .frame(width: size, height: size)
            Text("\(position.x.roundedToInt()) - \(position.y.roundedToInt())")
                .foregroundColor(.white)
        }
    }
    
    public static func == (lhs: ExamplePositionable, rhs: ExamplePositionable) -> Bool {
        lhs.position == rhs.position
    }
}
