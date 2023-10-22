//
//  ViewExtension.swift
//  
//
//  Created by Jose Manuel Ortiz Sanchez on 22/10/23.
//

import SwiftUI

extension View {
    
    func border(width: CGFloat, edges: [Edge], color: Color) -> some View {
        overlay(EdgeBorder(width: width, edges: edges).foregroundColor(color))
    }
}
