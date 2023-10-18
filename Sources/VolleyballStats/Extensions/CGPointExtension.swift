//
//  File.swift
//  
//
//  Created by Jose Manuel Ortiz Sanchez on 18/10/23.
//

import Foundation

extension CGPoint: Hashable {
    
    public static func == (lhs: CGPoint, rhs: CGPoint) -> Bool {
        lhs.x == rhs.x && lhs.y == rhs.y
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
}
