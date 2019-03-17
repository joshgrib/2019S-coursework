//
//  ViewController.swift
//  TicTacToe
//
//  Created by user150937 on 3/16/19.
//  Copyright © 2019 Josh Gribbon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var welcomeText: UILabel!
    var welcomeMessage = "Welcome to Tic-Tac-Toe"
    @IBOutlet weak var name1: UITextField!
    @IBOutlet weak var name2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeText.text = welcomeMessage
        // Do any additional setup after loading the view, typically from a nib.
    }
    /*
     Pass the player names along to the next view controller
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is ViewController2
        {
            let vc = segue.destination as? ViewController2
            vc?.currentPlayer = name1.text!
            vc?.nextPlayer = name2.text!
        }
    }

}

