//
//  PlayType.swift
//
//
//  Created by Jose Manuel Ortiz Sanchez on 18/10/23.
//

import Foundation

/// Enumeration representing types of volleyball actions.
public enum PlayType: String, CaseIterable {
    case serve = "SERVE"
    case pass = "PASS"
    case set = "SET"
    case spike = "SPIKE"
    case block = "BLOCK"
    case dig = "DIG"
    
    public var spanishType: String {
        switch self {
        case .serve:
            return "Saque"
        case .pass:
            return "Recepción"
        case .set:
            return "Colocación"
        case .spike:
            return "Ataque"
        case .block:
            return "Bloqueo"
        case .dig:
            return "Defensa"
        }
    }
}
