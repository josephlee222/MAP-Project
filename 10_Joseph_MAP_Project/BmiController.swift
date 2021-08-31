//
//  bmiController.swift
//  10_Joseph_MAP_Project
//
//  Created by CCIAD3 on 25/8/21.
//  Copyright © 2021 ITE. All rights reserved.
//

import UIKit

class BmiController: UIViewController {

    var bmi:Double = 0
    var weight:Double = 0
    var height:Double = 0
    var bmi_descriptor:bmiRanges?
    @IBOutlet var bmi_lbl: UILabel!
    @IBOutlet var bmi_range_lbl: UILabel!
    
    func showAlert(title: String, description: String, actiontext: String) {
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actiontext, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    enum bmiRanges:String, CaseIterable {
        case underweight = "Underweight Range"
        case healthy = "Healthy Range"
        case overweight = "Overweight Range"
        case obese = "Obesity"
    }
    
    @IBAction func info_btn(_ sender: Any) {
        showAlert(title: "BMI Formula", description: "\(weight) kg / (\(height) m * \(height) m) = \(bmi)", actiontext: "Got it")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // bmi_lbl.text = "\(String(format: "%.2f", bmi))"
        bmi_lbl.text = "\(bmi)"
        switch bmi {
        case let x where x < 18.5:
            bmi_descriptor = .underweight
        case let x where x >= 18.5 && x < 25.0:
            bmi_descriptor = .healthy
        case let x where x >= 25.0 && x < 30.0:
            bmi_descriptor = .overweight
        case let x where x >= 30.0:
            bmi_descriptor = .obese
        default:
            bmi_descriptor = nil
        }
        
        bmi_range_lbl.text = bmi_descriptor?.rawValue == nil ? "Unknown" : bmi_descriptor?.rawValue
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
