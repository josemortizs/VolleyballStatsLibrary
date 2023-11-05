//
//  PassType.swift
//
//
//  Created by Jose Manuel Ortiz Sanchez on 5/11/23.
//

import Foundation

/// Enumeration represents the different options with which to receive a serve
public enum PassType: String, CaseIterable {
    case forearmsCenter = "FOREARMSCENTER"
    case forearmsDown = "FOREARMSDOWN"
    case forearmsRight = "FOREARMSRIGHT"
    case forearmsLeft = "FOREARMSLEFT"
    case highHand = "HIGHHAND"
    
    public var spanishType: String {
        switch self {
        case .forearmsCenter:
            return "Centrada, de antebrazos"
        case .forearmsDown:
            return "De antebrazos, baja"
        case .forearmsRight:
            return "De antebrazos, sobre la derecha"
        case .forearmsLeft:
            return "De antebrazos, sobre la izquierda"
        case .highHand:
            return "De mano alta"
        }
    }
}
