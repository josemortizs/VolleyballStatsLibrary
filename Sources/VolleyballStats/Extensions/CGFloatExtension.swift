//
//  CGFloatExtension.swift
//
//
//  Created by Jose Manuel Ortiz Sanchez on 22/10/23.
//

import Foundation
import CoreGraphics

extension CGFloat {
    func roundedToInt() -> Int {
        return Int(self.rounded())
    }
}
