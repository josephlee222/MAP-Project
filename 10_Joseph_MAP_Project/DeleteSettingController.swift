//
//  DeleteSettingController.swift
//  10_Joseph_MAP_Project
//
//  Created by Joseph Lee on 28/8/21.
//  Copyright © 2021 Joseph Lee. All rights reserved.
//

import UIKit

class DeleteSettingController: UIViewController {
    
    @IBAction func delete_btn(_ sender: Any) {
        let alert = UIAlertController(title: "Confirm delete?", message: "Your data will be lost FOREVER!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: {action in
            let current_user:String? = userInfo.string(forKey: "current_user")
            userInfo.removeObject(forKey: current_user!)
            userInfo.removeObject(forKey: "\(current_user!)_healthdata")
            userInfo.removeObject(forKey: "current_user")
            self.performSegue(withIdentifier: "toLogin", sender: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "Delete Account"
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
