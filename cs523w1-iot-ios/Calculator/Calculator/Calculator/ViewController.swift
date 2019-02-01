//
//  ViewController.swift
//  Calculator
//
//  Created by user150937 on 1/31/19.
//  Copyright © 2019 Josh Gribbon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func ButtonClick(_ sender: Any) {
        CalculatorDisplay.text = "Clicked";
    }
    
    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var CalculatorDisplay: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        CalculatorDisplay.text = "Total: 0";
    }

}

