//
//  OptionsController.swift
//  10_Joseph_MAP_Project
//
//  Created by CCIAD3 on 25/8/21.
//  Copyright © 2021 ITE. All rights reserved.
//

import UIKit

class OptionsController: UIViewController {
    @IBOutlet var signin_lbl: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        signin_lbl.text = userInfo.string(forKey: "current_user")
        // Do any additional setup after loading the view.
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
