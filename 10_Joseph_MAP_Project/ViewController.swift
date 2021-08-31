//
//  ViewController.swift
//  10_Joseph_MAP_Project
//
//  Created by CCIAD3 on 4/8/21.
//  Copyright © 2021 Joseph Lee. All rights reserved.
//

import UIKit

var userInfo = UserDefaults.standard

class ViewController: UIViewController {
    @IBOutlet var username_field: UITextField!
    @IBOutlet var password_field: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // performSegue(withIdentifier: "intro", sender: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        performSegue(withIdentifier: "intro", sender: nil)
    }
    
    // Function for generating alerts
    func showAlert(title: String, description: String, actiontext: String) {
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actiontext, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func login_btn(_ sender: Any) {
        if let userinfo = (userInfo.dictionary(forKey: username_field.text!)) {
            // Check whether username and password is correct
            if (userinfo["Password"] as? String == password_field.text) {
                // Login successful
                userInfo.set("\(userinfo["Username"] ?? "Unknown")", forKey: "current_user")
                performSegue(withIdentifier: "statsNavigation", sender: nil)
            } else {
                // Login unsuccessful, show error alert
                showAlert(title: "Signin unsuccessful", description: "Unable to sign in. Please check if your username and password is correct", actiontext: "Try again")
            }
        } else {
            // Dictonary not created yet, show error alert
            showAlert(title: "Signin unsuccessful", description: "Unable to sign in. Please check if your username and password is correct", actiontext: "Try again")
        }
    }
    
    @IBAction func unwindtoBoot(segue:UIStoryboardSegue) {
        
    }

}

