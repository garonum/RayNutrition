//
//  Rays.swift
//  RayNutrition_1.0
//
//  Created by LA'D on 11.04.2020.
//  Copyright © 2020 Garonum. All rights reserved.
//

import UIKit

class Rays {
    var rayName: String?
    var slices: [Slices] = []
    let amount:[Ray]
    
    
    init (rayName: String) {
        self.rayName = rayName
        
        
        let fourth = Slices()
                 fourth.productsName = "Фрукты, ягоды, сметана"
                 fourth.platName = "Звездный План"
                 fourth.directionOfObservation = "Будущее"
                 
             let third = Slices()
                 third.productsName = "Овощи, сливочное масло"
                 third.platName = "План Солнца"
                 third.directionOfObservation = "Настоящее"
                 
             let second = Slices()
                 second.productsName = "Растительный белок, растительное масло"
                 second.platName = "План Человека"
                 second.directionOfObservation = "Прошлое"
                 
             let first = Slices()
                 first.productsName = "Белок(Рыба, морепродукты), рыбий жир)"
                 first.platName = "План Земли"
                 first.directionOfObservation = "Подсказки"
                 
                 let ray = Ray(slices: [fourth, third, second, first ])
        
        self.slices = ray.slices
        print(ray.slices.self)
        self.amount.insert([fourth, third, second, first ], at: 0)
    }
   
}
