//
//  MeasurementsController.swift
//  10_Joseph_MAP_Project
//
//  Created by Joseph Lee on 8/8/21.
//  Copyright © 2021 Joseph Lee. All rights reserved.
//

import UIKit

class MeasurementsController: UIViewController {
    @IBOutlet weak var activitySlider: UISlider!
    @IBOutlet var gender_controls: UISegmentedControl!
    @IBOutlet var weight_tf: UITextField!
    @IBOutlet var height_tf: UITextField!
    @IBOutlet var age_tf: UITextField!
    
    func showAlert(title: String, description: String, actiontext: String) {
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actiontext, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func save_btn(_ sender: Any) {
        if (weight_tf.text != "" && height_tf.text != "" && age_tf.text != "") {
            let gender = gender_controls.selectedSegmentIndex == 0 ? "Male" : "Female"
            let activity_lvl_male = [1.0, 1.12, 1.27, 1.54]
            let activity_lvl_female = [1.0, 1.14, 1.27, 1.45]
            var activity_lvl = 0.0
            if (gender == "Male") {
                activity_lvl = activity_lvl_male[Int(activitySlider.value)]
            } else {
                activity_lvl = activity_lvl_female[Int(activitySlider.value)]
            }
            let weight:Double = Double(weight_tf.text!)!
            let height:Double = Double(height_tf.text!)!
            let age:Int = Int(age_tf.text!)!
            
            let current_user:String = userInfo.string(forKey: "current_user")!
            print(current_user)
            userInfo.set([
                "gender": gender,
                "weight": weight,
                "height": height,
                "age": age,
                "activity_lvl": activity_lvl
            ], forKey: "\(current_user)_healthdata")
            
            let alert = UIAlertController(title: "Measurements Saved", message: "Your measuresurements has been saved!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: {action in
                self.performSegue(withIdentifier: "ExitMeasurements", sender: nil)
            }))
            self.present(alert, animated: true, completion: nil)
        } else {
            showAlert(title: "Unable to save", description: "Please check that all fields has been filled up", actiontext: "Okay")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Checking for existing data
        if let userinfo:Dictionary = userInfo.dictionary(forKey: "\(userInfo.string(forKey: "current_user") ?? "user")_healthdata") {
            weight_tf.text = "\(userinfo["weight"] ?? "")"
            height_tf.text = "\(userinfo["height"] ?? "")"
            age_tf.text = "\(userinfo["age"] ?? "")"
            
            if (userinfo["gender"] as? String == "Male") {
                switch userinfo["activity_lvl"] as? Double {
                case 1.0:
                    activitySlider.value = 0
                case 1.12:
                    activitySlider.value = 1
                case 1.27:
                    activitySlider.value = 2
                case 1.54:
                    activitySlider.value = 3
                default:
                    activitySlider.value = 0
                }
            } else {
                switch userinfo["activity_lvl"] as? Double {
                case 1.0:
                    activitySlider.value = 0
                case 1.14:
                    activitySlider.value = 1
                case 1.27:
                    activitySlider.value = 2
                case 1.45:
                    activitySlider.value = 3
                default:
                    activitySlider.value = 0
                }
            }
            
            switch userinfo["gender"] as? String {
            case "Male":
                gender_controls.selectedSegmentIndex = 0
            case "Female":
                gender_controls.selectedSegmentIndex = 1
            default:
                gender_controls.selectedSegmentIndex = 0
            }
        }
    }
    
    @IBAction func activityValueChanged(_ sender: Any) {
        activitySlider.value = round(activitySlider.value)
    }
}
