//
//  buttons.swift
//  Conversion Calculator
//
//  Created by David Lawanson on 4/13/18.
//  Copyright © 2018 David Lawanson. All rights reserved.
//

import Foundation

enum Button: String {
    case Zero = "0"
    case One = "1"
    case Two = "2"
    case Three = "3"
    case Four = "4"
    case Five = "5"
    case Six = "6"
    case Seven = "7"
    case Eight = "8"
    case Nine = "9"
    case Invert = "+/-"
    case Convert = "Converter"
    case Decimal = "."
    case Clear = "C"
    
    
    var isDigit: Bool {
        switch self {
        case .Zero, .One, .Two, .Three, .Four, .Five, .Six, .Seven, .Eight, .Nine:
            return true
        default:
            return false
        }
    }
    
}
