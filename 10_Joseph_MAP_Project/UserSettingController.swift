//
//  UserSettingController.swift
//  10_Joseph_MAP_Project
//
//  Created by Joseph Lee on 28/8/21.
//  Copyright © 2021 Joseph Lee. All rights reserved.
//

import UIKit

class UserSettingController: UIViewController {
    @IBOutlet var newuser_tf: UITextField!
    @IBOutlet var confirmpw_tf: UITextField!
    
    func showAlert(title: String, description: String, actiontext: String) {
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actiontext, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func save_btn(_ sender: Any) {
        if (newuser_tf.text != "" && confirmpw_tf.text != "") {
            let current_user:String = userInfo.string(forKey: "current_user")!
            var user_info:Dictionary = userInfo.dictionary(forKey: current_user)!
            
            if (user_info["Password"] as? String == confirmpw_tf.text) {
                if (userInfo.dictionary(forKey: newuser_tf.text!) == nil) {
                    user_info["Username"] = newuser_tf.text
                    userInfo.set(user_info, forKey: newuser_tf.text!)
                    userInfo.removeObject(forKey: current_user)
                    userInfo.set(newuser_tf.text, forKey: "current_user")
                    userInfo.set(userInfo.dictionary(forKey: "\(current_user)_healthdata"), forKey: "\(newuser_tf.text!)_healthdata")
                    userInfo.removeObject(forKey: "\(current_user)_healthdata")
                    showAlert(title: "Username Changed", description: "Username changed successfully", actiontext: "Okay")
                } else {
                    showAlert(title: "Username Taken", description: "Useranme has been taken, please choose another one", actiontext: "Try again")
                }
            } else {
                showAlert(title: "Invaild Password", description: "Your existing password is invaild", actiontext: "Try again")
            }
        } else {
            showAlert(title: "Empty fields", description: "Please fill in all fields to change the username", actiontext: "Okay")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "Edit Username"
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
