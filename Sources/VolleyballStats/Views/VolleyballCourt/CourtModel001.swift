//
//  CourtModel001.swift
//
//
//  Created by Jose Manuel Ortiz Sanchez on 21/10/23.
//

import SwiftUI
import Foundation

// TODO: Pendiente de terminar de implementar closure con player pulsado, nueva posición del player, etc
struct CourtModel001<Player: PositionableProtocol>: View {
    
    private let width: CGFloat
    private let height: CGFloat
    private let lineWidth: CGFloat
    private let players: [Player]
    
    init(size: CGSize,  players: [Player]) {
        self.width = size.width / 9
        self.height = size.height / 9
        self.lineWidth = max(size.width, size.height) / 90
        self.players = players
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            
            Color.customBlue.ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 0) {
                ForEach(1..<10) { row in
                    HStack(alignment: .center, spacing: 0) {
                        ForEach(1..<10) { column in
                            VStack {
                                Text("\(column) - \(row)")
                                getPlayer(row: row, column: column)
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
    
    @ViewBuilder private func getPlayer(row: Int, column: Int) -> some View {
        if let player = players.first(where: { player in
            player.position.x.roundedToInt() == column && player.position.y.roundedToInt() == row
        }) {
            player
        }
    }
}

#Preview {
    CourtModel001<ExamplePositionable>(size: CGSize(width: 750, height: 750), players: [
        ExamplePositionable(position: CGPoint(x: 3, y: 3))
    ])
}

struct ExamplePositionable: PositionableProtocol {
    
    var position: CGPoint
    
    var body: some View {
        Text("\(position.x.roundedToInt()) - \(position.y.roundedToInt())")
            .foregroundColor(.white)
    }
}
