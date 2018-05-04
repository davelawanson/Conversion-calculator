//
//  conversions.swift
//  Conversion Calculator
//
//  Created by David Lawanson on 4/13/18.
//  Copyright © 2018 David Lawanson. All rights reserved.
//

import Foundation

import Foundation

struct Converter {
    let label: String
    let inputUnit: String
    let outputUnit: String
    
    init(label: String, inputUnit: String, outputUnit: String) {
        self.label = label
        self.inputUnit = inputUnit
        self.outputUnit = outputUnit
    }
}


