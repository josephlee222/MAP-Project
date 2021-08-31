//
//  StatsViewController.swift
//  10_Joseph_MAP_Project
//
//  Created by CCIAD3 on 6/8/21.
//  Copyright © 2021 Joseph Lee. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    @IBOutlet var welcome_lbl: UILabel!
    var person:personHealth?
    var user_info:Dictionary? = userInfo.dictionary(forKey: "\(userInfo.string(forKey: "current_user") ?? "user")_healthdata")
    
    class personHealth{
        var gender:String = ""
        var weight:Double = 0
        var height:Double = 0
        var age:Int = 0
        var activity_lvl:Double = 0
        
        init(gender: String, weight:Double, height:Double, age:Int, activity_lvl:Double) {
            self.gender = gender
            self.weight = weight
            self.height = height
            self.age = age
            self.activity_lvl = activity_lvl
        }
        
        func calc_BMI() -> Double {
            // BMI function here (Placeholder ATM)
            let bmi = weight / (height * height)
            return Double(round(100*bmi)/100)
        }
        
        func calc_calorie() -> Int {
            // Carlorie recommendation function her (Placeholder ATM)
            var calorie:Double = 0
            if gender == "Male" {
                calorie = 14.2 * weight + 503 * height
                calorie = 864 - 9.72 * Double(age) + activity_lvl * calorie
            } else {
                calorie = 10.9 * weight + 660.7 * height
                calorie = 387 - 7.31 * Double(age) + activity_lvl * calorie
            }
            return Int(calorie)
        }
    }
    
    func showAlert(title: String, description: String, actiontext: String) {
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actiontext, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func BMI_View(_ sender: Any) {
        performSegue(withIdentifier: "bmi_segue", sender: nil)
    }
    
    @IBAction func Calorie_View(_ sender: Any) {
        performSegue(withIdentifier: "calorie_segue", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let logout_btn = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logout))
        logout_btn.tintColor = UIColor.red
        
        navigationItem.rightBarButtonItem = logout_btn
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Future use
        welcome_lbl.text = "Welcome back, \(userInfo.string(forKey: "current_user") ?? "user")"
        if (userInfo.object(forKey: "\(userInfo.string(forKey: "current_user") ?? "")_healthdata") == nil) {
            let alert = UIAlertController(title: "Measurements Needed", message: "Please input your measurements before viewing this page", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: {action in
                self.performSegue(withIdentifier: "Measurements", sender: nil)
            }))
            self.present(alert, animated: true, completion: nil)
        } else {
            self.user_info = userInfo.dictionary(forKey: "\(userInfo.string(forKey: "current_user") ?? "user")_healthdata")!
            self.person = personHealth(
                gender: user_info!["gender"] as! String,
                weight: user_info!["weight"] as! Double,
                height: user_info!["height"] as! Double,
                age: user_info!["age"] as! Int,
                activity_lvl: user_info!["activity_lvl"] as! Double
            )
        }
    }
    
    @objc func logout() {
        userInfo.removeObject(forKey: "current_user")
        performSegue(withIdentifier: "logout", sender: nil)
    }
    
    @IBAction func unwindtoStats(segue:UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "calorie_segue":
            let destinationVC = segue.destination as! CalorieController
            destinationVC.calorie = person!.calc_calorie()
            destinationVC.height = person!.height
            destinationVC.weight = person!.weight
            destinationVC.age = person!.age
            destinationVC.gender = person!.gender
            destinationVC.activity_lvl = person!.activity_lvl
        case "bmi_segue":
            let destinationVC = segue.destination as! BmiController
            destinationVC.height = person!.height
            destinationVC.weight = person!.weight
            destinationVC.bmi = person!.calc_BMI()
        default:
            break
        }
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
