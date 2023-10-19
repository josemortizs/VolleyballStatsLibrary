//
//  PlayBookProtocol.swift
//
//
//  Created by Jose Manuel Ortiz Sanchez on 19/10/23.
//

import Foundation

protocol PlayBookProtocol: PlayGenerator {
    func getOptions() -> [PlayOption]
}
