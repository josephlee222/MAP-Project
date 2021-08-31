//
//  _0_Joseph_MAP_ProjectTests.swift
//  10_Joseph_MAP_ProjectTests
//
//  Created by CCIAD3 on 4/8/21.
//  Copyright © 2021 ITE. All rights reserved.
//

import XCTest
@testable import Health_App

class Health_App: XCTestCase {
    var personMale = StatsViewController.personHealth(gender: "Male", weight: 75, height: 1.8, age: 18, activity_lvl: 1.54)
    var personFemale = StatsViewController.personHealth(gender: "Female", weight: 65, height: 1.7, age: 16, activity_lvl: 1)

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMaleCalories() {
        // Test male calories calculation
        XCTAssert(personMale.calc_calorie() == 3723)
    }
    
    func testFemaleCalories() {
        // Test female calories calculation
        XCTAssert(personFemale.calc_calorie() == 2101)
    }
    
    func testMaleBMI() {
        XCTAssert(personMale.calc_BMI() == 23.15)
    }
    
    func testFemaleBMI() {
        XCTAssert(personFemale.calc_BMI() == 22.49)
        
    }
}
