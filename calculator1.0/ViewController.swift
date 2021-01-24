//
//  ViewController.swift
//  calculator1.0
//
//  Created by Shashwat on 24/01/21.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var result: UILabel!
    var inmiddle = false
    @IBAction func operand(_ sender: UIButton) {
        let num = sender.currentTitle!
        desc.text=brain.description
        if inmiddle{
            result.text=result.text!+num
        }else{
            result.text=num
        }
        inmiddle=true
        
    }
    
    var getAns:Double{
        get{
            return Double(result.text!)!
        }
        set{
            result.text=String(newValue)
        }
    }
    var brain = CalculatorBrain()
    @IBAction func clearAll(_ sender: UIButton) {
        desc.text="0.0"
        brain=CalculatorBrain()
        getAns = 0.0
        inmiddle=false
    }
    @IBAction func `operator`(_ sender: RoundButton) {
        desc.text=brain.description
        if inmiddle{
            brain.setOperand(operand: getAns)
            inmiddle=false
        }
        if let symbol = sender.currentTitle{
            brain.performOperation(symbol: symbol)
        }
        getAns = brain.result
    }
    
}

