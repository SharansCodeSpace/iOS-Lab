//
//  ViewController.swift
//  Travel_Planner
//
//  Created by Apple Lab 26 on 11/04/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        errorLabel.text = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        errorLabel.text = ""
    }

    @IBAction func unwindToLogin(unwindSegue: UIStoryboardSegue) {
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "goToTripList" {
            let correctUsername = "sharan"
            let correctPassword = "1234"

            let enteredUsername = usernameTextField.text ?? ""
            let enteredPassword = passwordTextField.text ?? ""

            if enteredUsername == correctUsername && enteredPassword == correctPassword {
                usernameTextField.text = ""
                passwordTextField.text = ""
                return true
            } else {
                errorLabel.text = "Invalid Credentials"
                errorLabel.textColor = .systemRed
                return false
            }
        }

        return true
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToTripList",
        let _ = segue.destination as? TripListViewController {
            self.navigationItem.backButtonTitle = "Logout"
        }
    }
}

