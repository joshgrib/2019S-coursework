//
//  ViewController.swift
//  Table
//
//  Created by user150937 on 3/3/19.
//  Copyright © 2019 Josh Gribbon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    let superHeroes=["Superman", "Batman", "Wonder Woman", "The Flash", "Green Lantern", "Aquaman"]
    let realNames=["Clark Kent", "Bruce Wayne", "Princess Diana", "Barry Allen", "Hal Jordan", "Arthur Curry"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myTableView.delegate=self
        myTableView.dataSource=self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superHeroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell=myTableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text=superHeroes[indexPath.row]
        cell?.detailTextLabel?.text=realNames[indexPath.row]
        
        return cell!
        
    }
}
