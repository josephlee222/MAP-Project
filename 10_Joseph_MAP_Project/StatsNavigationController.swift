//
//  StatsNavigationController.swift
//  10_Joseph_MAP_Project
//
//  Created by Joseph Lee on 8/8/21.
//  Copyright © 2021 ITE. All rights reserved.
//

import UIKit

class StatsNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if (userInfo.object(forKey: "\(String(describing: userInfo.string(forKey: "current_user")))_healthdata") == nil) {
            performSegue(withIdentifier: "InitalMeasurements", sender: nil)
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
