//
//  ViewController.swift
//  Assign3Second
//
//  Created by Apple Lab 26 on 03/02/25.
//

import UIKit

class ViewController: UIViewController {
    
    var lightOn = true;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    @IBOutlet var lightButton: UIButton!

    func updateUI() {
        if lightOn {
            view.backgroundColor = .white
            lightButton.setTitle("Off", for: .normal)
          } else {
            view.backgroundColor = .black
            lightButton.setTitle("On", for: .normal)
          }
    }
    
    func updateButtonColor() {
        lightButton.backgroundColor = lightOn ? .black : .white
        lightButton.setTitleColor(lightOn ? .black : .white, for: .normal)
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        lightOn.toggle()
        updateUI()
    }
    
}

