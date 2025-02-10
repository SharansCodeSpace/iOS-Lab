//
//  ViewController.swift
//  Assign3First
//
//  Created by Apple Lab 26 on 03/02/25.
//  Sharaneshwar Bharat Punjal - 23520011

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Warnings - Initialization of value 'x' was never used
        let x = 4
        
        // Compiler Error - navigationController.title = "Debugging"
        navigationController?.title = "Debugging"
        
        // Bugs
        var names = ["Tammy", "Cole"] // Creating a breakpoint here
        names.removeFirst()
        names.removeFirst()
        // names.removeFirst() // Empty Collection, can't remove first element
        
        
        
    }


}

