//
//  ViewController.swift
//  Calculator
//
//  Created by user150937 on 1/31/19.
//  Copyright © 2019 Josh Gribbon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ZeroButton: UIButton!
    @IBOutlet weak var OneButton: UIButton!
    @IBOutlet weak var TwoButton: UIButton!
    @IBOutlet weak var ThreeButton: UIButton!
    @IBOutlet weak var FourButton: UIButton!
    @IBOutlet weak var FiveButton: UIButton!
    @IBOutlet weak var SixButton: UIButton!
    @IBOutlet weak var SevenButton: UIButton!
    @IBOutlet weak var EightButton: UIButton!
    @IBOutlet weak var NineButton: UIButton!
    @IBOutlet weak var EqualsButton: UIButton!
    @IBOutlet weak var ClearButton: UIButton!
    @IBOutlet weak var PlusButton: UIButton!
    @IBOutlet weak var MinusButton: UIButton!
    @IBOutlet weak var DivideButton: UIButton!
    @IBOutlet weak var MultiplyButton: UIButton!
    
    @IBOutlet weak var CalculatorDisplay: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        CalculatorDisplay.text = "";
    }
    
    func Parse(equation: String) -> Double {
        // determine what to do in order of operations: * / + -
        // reversed so it works out with the recursion
        var operation: Character = "_";
        
        if (equation.contains("-")) { operation = "-"; }
        else if (equation.contains("+")) { operation = "+"; }
        else if (equation.contains("/")) { operation = "/"; }
        else if (equation.contains("*")) { operation = "*"; }
        
        print("\(equation): \(operation)");
        
        // base case - fully parsed
        if (operation == "_") { return Double(String(equation))!; }
        
        // find the last index so the operations happen left->right
        let operatorIndex = equation.lastIndex(of: operation)!;
        // split the equation to get the halves on either side of the operator
        let before: String = equation.substring(to: operatorIndex);
        let after: String = equation.substring(from: operatorIndex).dropFirst().uppercased();
        
        let parsedBefore: Double = Parse(equation: before);
        let parsedAfter: Double = Parse(equation: after);
        
        switch (operation) {
            case "-": return parsedBefore - parsedAfter;
            case "+": return parsedBefore + parsedAfter;
            case "/": return parsedBefore / parsedAfter;
            case "*": return parsedBefore * parsedAfter;
            default: return 0;
        }
    }
    
    @IBAction func ZeroButtonClick(_ sender: Any) {
        CalculatorDisplay.text?.append("0");
    }
    @IBAction func OneButtonClick(_ sender: Any) {
        CalculatorDisplay.text?.append("1");
    }
    @IBAction func TwoButtonClick(_ sender: Any) {
        CalculatorDisplay.text?.append("2");
    }
    @IBAction func ThreeButtonClick(_ sender: Any) {
        CalculatorDisplay.text?.append("3");
    }
    @IBAction func FourButtonClick(_ sender: Any) {
        CalculatorDisplay.text?.append("4");
    }
    @IBAction func FiveButtonClick(_ sender: Any) {
        CalculatorDisplay.text?.append("5");
    }
    @IBAction func SixButtonClick(_ sender: Any) {
        CalculatorDisplay.text?.append("6");
    }
    @IBAction func SevenButtonClick(_ sender: Any) {
        CalculatorDisplay.text?.append("7");
    }
    @IBAction func EightButtonClick(_ sender: Any) {
        CalculatorDisplay.text?.append("8");
    }
    @IBAction func NineButtonClick(_ sender: Any) {
        CalculatorDisplay.text?.append("9");
    }
    @IBAction func PlusButtonClick(_ sender: Any) {
        CalculatorDisplay.text?.append("+");
    }
    @IBAction func MinusButtonClick(_ sender: Any) {
        CalculatorDisplay.text?.append("-");
    }
    @IBAction func DivideButtonClick(_ sender: Any) {
        CalculatorDisplay.text?.append("/");
    }
    @IBAction func MultipleButtonClick(_ sender: Any) {
        CalculatorDisplay.text?.append("*");
    }
    @IBAction func EqualsButtonClick(_ sender: Any) {
        let equation: String = CalculatorDisplay.text!;
        let value: Double = Parse(equation: equation);
        CalculatorDisplay.text = String(value);
    }
    @IBAction func ClearButtonClick(_ sender: Any) {
        CalculatorDisplay.text = "";
    }
}

