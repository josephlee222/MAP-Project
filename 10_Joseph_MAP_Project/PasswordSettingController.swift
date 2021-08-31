//
//  PasswordSettingController.swift
//  10_Joseph_MAP_Project
//
//  Created by Joseph Lee on 28/8/21.
//  Copyright © 2021 Joseph Lee. All rights reserved.
//

import UIKit

class PasswordSettingController: UIViewController {
    @IBOutlet var currentpw_tf: UITextField!
    @IBOutlet var newpw_tf: UITextField!
    @IBOutlet var confirmpw_tf: UITextField!
    
    func showAlert(title: String, description: String, actiontext: String) {
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actiontext, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func save_btn(_ sender: Any) {
        if (currentpw_tf.text != "" && newpw_tf.text != "" && confirmpw_tf.text != "") {
            let current_user:String = userInfo.string(forKey: "current_user")!
            let current_pw:String = userInfo.dictionary(forKey: current_user)!["Password"] as! String
            
            if (current_pw == currentpw_tf.text && newpw_tf.text == confirmpw_tf.text) {
                var userinfo:Dictionary? = userInfo.dictionary(forKey: current_user)
                userinfo!["Password"] = self.newpw_tf.text!
                userInfo.set(userinfo, forKey: current_user)
                showAlert(title: "Password Changed", description: "Password successfully changed!", actiontext: "Okay")
            } else {
                showAlert(title: "Invaild Password", description: "Your existing password is invaild or the new passwords does not match", actiontext: "Try again")
            }
        } else {
            showAlert(title: "Empty fields", description: "Please fill in all fields to change the password", actiontext: "Okay")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "Edit Password"
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
