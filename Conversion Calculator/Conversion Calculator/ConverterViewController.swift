//
//  ConverterViewController.swift
//  Conversion Calculator
//
//  Created by David Lawanson on 4/13/18.
//  Copyright © 2018 David Lawanson. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var convertedTextField: UITextField!
    
    var inverted = true
    var currentInput = ""
    var currentConversion: Conversion? = nil

    let conversions = [
                        Conversion(initialUnit: UnitSpeed.milesPerHour, desiredUnit: UnitSpeed.kilometersPerHour),
                       Conversion(initialUnit: UnitSpeed.kilometersPerHour, desiredUnit: UnitSpeed.milesPerHour),
                       Conversion(initialUnit: UnitTemperature.fahrenheit, desiredUnit: UnitTemperature.celsius),
                       Conversion(initialUnit: UnitTemperature.celsius, desiredUnit: UnitTemperature.fahrenheit),
                     ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handleButtonPressed(_ sender: UIButton) {
        let pressed = Button(rawValue: sender.currentTitle!)
        
        if case let isButtonDigit = pressed?.isDigit, isButtonDigit == true {
            // if convertedTextField isn't empty, unit conversion just occured. clear everything on button press.
            if (!convertedTextField.text!.isEmpty) {
                clear()
            }
            inputTextField.text?.append(pressed!.rawValue)
            currentInput += pressed!.rawValue
            
        } else {
            // if not digit, handle specific Button cases
            switch (pressed!) {
                
            case .Clear:
                clear()
                
            case .Convert:
                let alert = UIAlertController(title: "Converter", message: "Select conversion", preferredStyle: UIAlertControllerStyle.actionSheet)
                
                // create actions for every conversion in conversions collection
                for convertee in conversions {
                    alert.addAction(UIAlertAction(title: "\(convertee.initialUnit.symbol) to \(convertee.desiredUnit.symbol)", style: UIAlertActionStyle.default, handler: {
                        (alertAction) -> Void in
                        if let stringToDouble = Double(self.currentInput) {
                            self.currentConversion = convertee
                           
                        }
                    }))
                }
                
                self.present(alert, animated: true, completion:  nil)
            case .Decimal:
                // if converted isn't empty, clear and start over
                if (!convertedTextField.text!.isEmpty) {
                    clear()
                }
                // no need to append multiple decimals. disallowing prevents errors
                if (!inputTextField.text!.contains(".")) {
                    inputTextField.text! += "."
                    currentInput += "."
                }
                
            case .Invert:
                if (inverted) {
                    currentInput.insert("-", at: currentInput.startIndex)
                } else {
                    currentInput.remove(at: currentInput.startIndex)
                }
                
                if let convertee = currentConversion, let input = Double(currentInput) {
                    
                } else {
                    inputTextField.text = currentInput
                }
                inverted = !inverted
                
            default:
                print("default case reached")
                
            }
        }
        //print("case: \(pressed!) raw: \(pressed!.rawValue)")
    }
    
    
    func clear() {
        inputTextField.text = ""
        currentInput = ""
        
        convertedTextField.text = ""
        
        inverted = true
        currentConversion = nil
    }
    

}
