//
//  ServeType.swift
//
//
//  Created by Jose Manuel Ortiz Sanchez on 5/11/23.
//

import Foundation

/// Enumeration that represents the different types of serve
public enum ServeType: String, CaseIterable {
    case lowHand = "LOWHAND"
    case highHand = "HIGHHAND"
    case floating = "FLOATING"
    case floatingInJump = "FLOATINGINJUMP"
    case power = "POWER"
    case powerInJump = "POWERINJUMP"
    
    public var spanishType: String {
        switch self {
        case .lowHand:
            return "Saque de mano baja"
        case .highHand:
            return "Saque de mano alta"
        case .floating:
            return "Saque flotante"
        case .floatingInJump:
            return "Saque flotante en salto"
        case .power:
            return "Saque en potencia"
        case .powerInJump:
            return "Saque en potencia en salto"
        }
    }
}
