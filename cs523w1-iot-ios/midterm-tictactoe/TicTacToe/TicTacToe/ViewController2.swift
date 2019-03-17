//
//  ViewController2.swift
//  TicTacToe
//
//  Created by user150937 on 3/16/19.
//  Copyright © 2019 Josh Gribbon. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    @IBOutlet weak var currentTurn: UILabel!
    var currentMark = "X"
    var nextMark = "O"
    var currentPlayer = "Player 1"
    var nextPlayer = "Player 2"
    let initMark = "~"
    
    /*
     Populated initial text values
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentTurn.text = currentPlayer
        
        topLeftButton.setTitle(initMark, for: .normal)
        topCenterButton.setTitle(initMark, for: .normal)
        topRightButton.setTitle(initMark, for: .normal)
        middleLeftButton.setTitle(initMark, for: .normal)
        middleCenterButton.setTitle(initMark, for: .normal)
        middleRightButton.setTitle(initMark, for: .normal)
        bottomLeftButton.setTitle(initMark, for: .normal)
        bottomCenterButton.setTitle(initMark, for: .normal)
        bottomRightButton.setTitle(initMark, for: .normal)
    }
    
    /*
     Pass the message back for who won the game
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is ViewController
        {
            let vc = segue.destination as? ViewController
            vc?.welcomeMessage = currentTurn.text!
        }
    }
    /*
     Handle a button click
        - Mark it if it hasn't been marked
        - Check if the game is finished, and if someone won who it is
    */
    func markButton(button: UIButton) {
        if(button.currentTitle==initMark && !gameIsWon()) {
            button.setTitle(currentMark, for: .normal)
            let temp = currentMark
            currentMark = nextMark
            nextMark = temp
        }
        if (gameIsDone()) {
            if(gameIsWon()) {
                currentTurn.text = "WINNER: " + currentPlayer
            } else if (allSelected()) {
                currentTurn.text = "NO WINNER"
            }
            performSegue(withIdentifier: "ReturnHome", sender: nil)
            
        } else {
            let temp = currentPlayer
            currentPlayer = nextPlayer
            currentTurn.text = nextPlayer
            nextPlayer = temp
        }
    }
    /*
    Check if three buttons have equal titles
    */
    func equalTitles (b1: UIButton, b2: UIButton, b3: UIButton) -> Bool {
        let t1 = b1.currentTitle
        let t2 = b2.currentTitle
        let t3 = b3.currentTitle
        return (t1 == t2) && (t2 == t3) && (t1 != initMark)
    }
    /*
    Check if a button has been selected to mark a move
    */
    func selected (btn: UIButton) -> Bool {
        return btn.currentTitle != initMark
    }
    /*
    Game status checks
     */
    func gameIsWon () -> Bool {
        let topRow = equalTitles(b1: topLeftButton, b2: topCenterButton, b3: topRightButton)
        let midRow = equalTitles(b1: middleLeftButton, b2: middleCenterButton, b3: middleRightButton)
        let bottomRow = equalTitles(b1: bottomLeftButton, b2: bottomCenterButton, b3: bottomRightButton)
        let leftCol = equalTitles(b1: topLeftButton, b2: middleLeftButton, b3: bottomLeftButton)
        let midCol = equalTitles(b1: topCenterButton, b2: middleCenterButton, b3: bottomCenterButton)
        let rightCol = equalTitles(b1: topRightButton, b2: middleRightButton, b3: bottomRightButton)
        let downCross = equalTitles(b1: topLeftButton, b2: middleCenterButton, b3: bottomRightButton)
        let upCross = equalTitles(b1: bottomLeftButton, b2: middleCenterButton, b3: topRightButton)
        return topRow || midRow || bottomRow || leftCol || midCol || rightCol || downCross || upCross
    }
    func allSelected () -> Bool {
        return selected(btn: topLeftButton) && selected(btn: topCenterButton) && selected(btn: topRightButton) && selected(btn: middleLeftButton) && selected(btn: middleCenterButton) && selected(btn: middleRightButton) && selected(btn: bottomLeftButton) && selected(btn: bottomCenterButton) && selected(btn: bottomRightButton)
    }
    func gameIsDone () -> Bool {
        return allSelected() || gameIsWon()
    }
    
    /*
     Handle all the button clicks
     */
    @IBOutlet weak var topLeftButton: UIButton!
    @IBAction func topLeftClick(_ sender: Any) {
        markButton(button: topLeftButton)
    }
    @IBOutlet weak var topCenterButton: UIButton!
    @IBAction func topCenterClick(_ sender: Any) {
        markButton(button: topCenterButton)
    }
    @IBOutlet weak var topRightButton: UIButton!
    @IBAction func topRightClick(_ sender: Any) {
        markButton(button: topRightButton)
    }
    @IBOutlet weak var middleLeftButton: UIButton!
    @IBAction func middleLeftClick(_ sender: Any) {
        markButton(button: middleLeftButton)
    }
    @IBOutlet weak var middleCenterButton: UIButton!
    @IBAction func middleCenterClick(_ sender: Any) {
        markButton(button: middleCenterButton)
    }
    @IBOutlet weak var middleRightButton: UIButton!
    @IBAction func middleRightClick(_ sender: Any) {
        markButton(button: middleRightButton)
    }
    @IBOutlet weak var bottomLeftButton: UIButton!
    @IBAction func bottomLeftClick(_ sender: Any) {
        markButton(button: bottomLeftButton)
    }
    @IBOutlet weak var bottomCenterButton: UIButton!
    @IBAction func bottomCenterClick(_ sender: Any) {
        markButton(button: bottomCenterButton)
    }
    @IBOutlet weak var bottomRightButton: UIButton!
    @IBAction func bottomRightClick(_ sender: Any) {
        markButton(button: bottomRightButton)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
