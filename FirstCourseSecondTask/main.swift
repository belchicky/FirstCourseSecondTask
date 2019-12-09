//
//  main.swift
//  FirstCourseSecondTask
//
//  Copyright © 2017 E-Legion. All rights reserved.
//

import Foundation
import FirstCourseSecondTaskChecker


let checker = Checker()

func firstFunction(array: [Int]) -> (Int, Int) {
    let evens = array.filter{ $0 % 2 == 0 }
    let odds = array.filter{ $0 % 2 != 0 }
    return (evens.count, odds.count)
}

checker.checkFirstFunction(function: firstFunction)

func secondCheck(arrOfCircle: [Checker.Circle]) -> [Checker.Circle] {
    var result = [Checker.Circle]()
    var tempCircle = Checker.Circle(radius: 0, color: .white)
    var tempBlue = [Checker.Circle]()
    
    for circle in arrOfCircle {
        tempCircle = circle
        switch circle.color {
        case .white:
            result.append(tempCircle)
        case .black:
            tempCircle.radius = circle.radius * 2.0
            result.append(tempCircle)
        case .red:
            ()
        case .green:
            tempCircle.color = .blue
            tempBlue.append(tempCircle)
        case .blue:
            tempBlue.append(tempCircle)
        }
    }
    result.append(contentsOf: tempBlue)
    
    return result
}

checker.checkSecondFunction(function: secondCheck)

func thirdFunction(dictionary: [Checker.EmployeeData]) -> [Checker.Employee] {
    var employee: [Checker.Employee] = []
    let newArray = ["fullName":"", "salary":"", "company":""]
    
    for key in dictionary {
        if key.keys == newArray.keys {
            if let fullName = key["fullName"], let salary = key["salary"], let company = key["company"] {
                let newEmployee = Checker.Employee(fullName: fullName, salary: salary, company: company)
                employee.append(newEmployee)
            }
        }
    }
    return employee
}
checker.checkThirdFunction(function: thirdFunction)

func fourthFunction(array: [String]) -> [String : [String]] {
   // let newDict = Dictionary(grouping: array, by: { String($0.first!) })
    var newDict = Dictionary(grouping: array, by: { String($0.first!) })
    for (key, value) in newDict {
        if value.count < 2 {
            newDict.removeValue(forKey: key)
        }
    }
    var newArray = [String: [String]]()
    newDict.forEach { newArray[String($0.key)] = $0.value.sorted(by: >) }
    return newArray
}
checker.checkFourthFunction(function: fourthFunction)
