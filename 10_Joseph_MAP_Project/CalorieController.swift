//
//  CalorieController.swift
//  10_Joseph_MAP_Project
//
//  Created by CCIAD3 on 25/8/21.
//  Copyright © 2021 Joseph Lee. All rights reserved.
//

import UIKit

class CalorieController: UIViewController {
    
    // Variable Initialisation
    var calorie:Int = 0
    var gender:String = ""
    var age:Int = 0
    var height:Double = 0
    var weight:Double = 0
    var activity_lvl:Double = 0
    @IBOutlet var calorie_lbl: UILabel!
    @IBOutlet var food_estimator_lbl: UILabel!
    
    // Enum of food calories
    enum food_calorie:Int, CaseIterable {
        case Banana = 89
        case apple = 52
        case Chicken_Rice = 607
        case Nasi_Lemak = 494
        case Mee_Goreng = 613
        case Roti_Prata = 164
        case Carrot_Cake = 493
        case Char_Kway_Teow = 744
    }
    
    func showAlert(title: String, description: String, actiontext: String) {
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actiontext, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func calcFoodCalorie(food:food_calorie) -> String {
        var food_name:String = ""
        // Check food assigned and set human readable string
        switch food {
        case .Banana:
            food_name = "Bananas"
        case .apple:
            food_name = "Apples"
        case .Chicken_Rice:
            food_name = "Chicken Rice"
        case .Nasi_Lemak:
            food_name = "Nasi Lemak"
        case .Mee_Goreng:
            food_name = "Mee Goreng"
        case .Roti_Prata:
            food_name = "Roti Prata (Plain)"
        case .Carrot_Cake:
            food_name = "White Carrot Cake"
        case .Char_Kway_Teow:
            food_name = "Char Kway Teow"
        }
        
        // Return number of food item and food name
        return "\(calorie / food.rawValue) \(food_name)"
    }
    
    @IBAction func info_btn(_ sender: Any) {
        var formula_desc:String = ""
        switch gender {
        case "Male":
            formula_desc = "864 - 9.72 * \(age) years + \(activity_lvl) * (14.2 * \(weight)kg + 503 * \(height)m) = \(calorie) Kcal"
        case "Female":
            formula_desc = "387 - 7.31 * \(age) years + \(activity_lvl) * (10.9 * \(weight)kg + 660.7 * \(height)m) = \(calorie) Kcal"
        default:
            formula_desc = "Error getting gender to show formula"
        }
        
        showAlert(title: "Calorie formula (\(gender))", description: formula_desc, actiontext: "Okay")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Display recommended calorie intake
        calorie_lbl.text = "\(calorie) Kcal"
        food_estimator_lbl.text = "≈ \(calcFoodCalorie(food: food_calorie.allCases[Int.random(in: 0...7)]))"
    }
}
