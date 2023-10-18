//
//  PlayerType.swift
//
//
//  Created by Jose Manuel Ortiz Sanchez on 18/10/23.
//

import Foundation

public enum PlayerType: String, CaseIterable {
    case outsideHitter = "OUTSIDE HITTER"
    case middleHitter = "MIDDLE HITTER"
    case oppositeHitter = "OPPOSITE HITTER"
    case setter = "SETTER"
    case libero = "LIBERO"
    
    public var spanishType: String {
        switch self {
        case .outsideHitter:
            return "Receptor"
        case .middleHitter:
            return "Central"
        case .oppositeHitter:
            return "Opuesto"
        case .setter:
            return "Colocador"
        case .libero:
            return "Líbero"
        }
    }
}
