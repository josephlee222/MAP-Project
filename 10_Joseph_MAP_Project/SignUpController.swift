//
//  SignUpController.swift
//  10_Joseph_MAP_Project
//
//  Created by CCIAD3 on 17/8/21.
//  Copyright © 2021 Joseph Lee. All rights reserved.
//

import UIKit

class SignUpController: UIViewController {
    @IBOutlet var username_tf: UITextField!
    @IBOutlet var password_tf: UITextField!
    @IBOutlet var c_password_tf: UITextField!
    
    func isKeyExist(Key:String) -> Bool {
        return userInfo.object(forKey: Key) != nil
    }
    
    func showAlert(title: String, description: String, actiontext: String) {
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actiontext, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func register_btn(_ sender: Any) {
        if (username_tf.text != "" || password_tf.text != "" || c_password_tf.text != "") {
            if (password_tf.text == c_password_tf.text) {
                if (!isKeyExist(Key: username_tf.text!)) {
                    userInfo.set(["Username":username_tf.text, "Password":password_tf.text], forKey: username_tf.text!)
                    let alert = UIAlertController(title: "Signup successful", message: "Sign up was successful. Thanks for registering!", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Return to login", style: .default, handler: { action in
                        self.performSegue(withIdentifier: "registerSuccess", sender: nil)
                    }))
                    self.present(alert, animated: true, completion: nil)
                } else {
                    showAlert(title: "Signup unsuccessful", description: "Unable to sign up as the username has been taken", actiontext: "Try again")
                }
                
            } else {
                showAlert(title: "Signup unsuccessful", description: "Unable to sign up. Passwords does not match, please try again", actiontext: "Try Again")
            }
        } else {
            showAlert(title: "Signup unsuccessful", description: "Unable to sign up. Please check if all field has been filled up.", actiontext: "Okay")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
