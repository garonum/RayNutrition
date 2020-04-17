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
    
    var earthAmount: [Ray] = []
    var humanAmount: [Ray] = []
    var returnAmount: [Ray] = []
    var exitAmount: [Ray] = []
    var earthRay =  Ray(slices: [])
    var humanRay =  Ray(slices: [])
    var returnRay =  Ray(slices: [])
    var exitRay =  Ray(slices: [])
    
    init (rayName: String) {
        self.rayName = rayName
        switch rayName {
        case "Луч Земли":
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
                      
             self.earthRay = Ray(slices: [fourth, third, second, first ])
             
            self.slices = earthRay.slices
            
             self.earthAmount = {
                 return [Ray(slices: [fourth, third, second, first ])]
             }()
        case "Луч Человека":
            let sixthSlice = Slices()
            sixthSlice.productsName = "Взбитое, отжатое, замороженное"
            sixthSlice.platName = "Закон Разума"
            sixthSlice.directionOfObservation = "Знаки"
            
            let fiveSlice = Slices()
            fiveSlice.productsName = "Пареное"
            fiveSlice.platName = "Закон отображения"
            fiveSlice.directionOfObservation = "Подсветки"
            
            let fourthSlice = Slices()
            fourthSlice.productsName = "Варёное"
            fourthSlice.platName = "Закон отражения"
            fourthSlice.directionOfObservation = "Подсказки"
            
            let thirdSlice = Slices()
            thirdSlice.productsName = "Печеное"
            thirdSlice.platName = "Закон выхода-возврата"
            thirdSlice.directionOfObservation = "Причины"
            
            let secondSlice = Slices()
            secondSlice.productsName = "Гриль, копченое"
            secondSlice.platName = "Закон легализации"
            secondSlice.directionOfObservation = "Процессы"
            
            let firstSlice = Slices()
            firstSlice.productsName = "Жареноое"
            firstSlice.platName = "Закон замещения"
            firstSlice.directionOfObservation = "Следствия"
            
            self.humanRay = Ray(slices: [sixthSlice, fiveSlice, fourthSlice, thirdSlice, secondSlice, firstSlice ])
             
            self.slices = humanRay.slices
            
             self.humanAmount = {
                 return [Ray(slices: [sixthSlice, fiveSlice, fourthSlice, thirdSlice, secondSlice, firstSlice])]
             }()
        case "Луч Возврата":

            let seventhSlice = Slices()
                seventhSlice.productsName = "Семена"
                seventhSlice.platName = "Плат Эффект"
                seventhSlice.directionOfObservation = "ЫЙИ-нить"
                //seventhSlice.numberOfViews = 57989654934
                
                let sixthSlice = Slices()
                sixthSlice.productsName = "Зерна"
                sixthSlice.platName = "Плат Вселенский"
                sixthSlice.directionOfObservation = "Ритмологический рисунок из ЫЙИ"
                
                let fiveSlice = Slices()
                fiveSlice.productsName = "Плоды"
                fiveSlice.platName = "Плат Знаний"
                fiveSlice.directionOfObservation = "Книга Озаригн"
                
                let fourthSlice = Slices()
                fourthSlice.productsName = "Цветы, мед"
                fourthSlice.platName = "Плат Любви"
                fourthSlice.directionOfObservation = "Книга Радастея"
                
                let thirdSlice = Slices()
                thirdSlice.productsName = "Листья"
                thirdSlice.platName = "Плат Славы"
                thirdSlice.directionOfObservation = "Книга Ирлем"
                
                let secondSlice = Slices()
                secondSlice.productsName = "Стебель"
                secondSlice.platName = "Плат Денег"
                secondSlice.directionOfObservation = "Ритмический рисунок из ЫЙИ"
                
                let firstSlice = Slices()
                firstSlice.productsName = "Корень"
                firstSlice.platName = "Плат Стыда"
                firstSlice.directionOfObservation = "ЫЙИ"
                self.returnRay = Ray(slices: [seventhSlice, sixthSlice, fiveSlice, fourthSlice, thirdSlice, secondSlice, firstSlice])
                           
            self.slices = returnRay.slices
                          
                self.returnAmount = {
                    return [Ray(slices: [seventhSlice, sixthSlice, fiveSlice, fourthSlice, thirdSlice, secondSlice, firstSlice ])]
                }()
        case "Луч Выхода":
            let ninthSlice = Slices()
                ninthSlice.productsName = "Семена"
                ninthSlice.platName = "Плат Эффект"
                ninthSlice.directionOfObservation = "ЫЙИ-нить"
                
            let eighthSlice = Slices()
                eighthSlice.productsName = "Семена"
                eighthSlice.platName = "Плат Эффект"
                eighthSlice.directionOfObservation = "ЫЙИ-нить"
                
            let seventhSlice = Slices()
                seventhSlice.productsName = "Семена"
                seventhSlice.platName = "Плат Эффект"
                seventhSlice.directionOfObservation = "ЫЙИ-нить"
                //seventhSlice.numberOfViews = 57989654934
                
            let sixthSlice = Slices()
                sixthSlice.productsName = "Зерна"
                sixthSlice.platName = "Плат Вселенский"
                sixthSlice.directionOfObservation = "Ритмологический рисунок из ЫЙИ"
                
            let fiveSlice = Slices()
                fiveSlice.productsName = "Плоды"
                fiveSlice.platName = "Плат Знаний"
                fiveSlice.directionOfObservation = "Книга Озаригн"
                
            let fourthSlice = Slices()
                fourthSlice.productsName = "Цветы, мед"
                fourthSlice.platName = "Плат Любви"
                fourthSlice.directionOfObservation = "Книга Радастея"
                
            let thirdSlice = Slices()
                thirdSlice.productsName = "Листья"
                thirdSlice.platName = "Плат Славы"
                thirdSlice.directionOfObservation = "Книга Ирлем"
                
            let secondSlice = Slices()
                secondSlice.productsName = "Стебель"
                secondSlice.platName = "Плат Денег"
                secondSlice.directionOfObservation = "Ритмический рисунок из ЫЙИ"
                
            let firstSlice = Slices()
                firstSlice.productsName = "Корень"
                firstSlice.platName = "Плат Стыда"
                firstSlice.directionOfObservation = "ЫЙИ"
            self.exitRay = Ray(slices: [ninthSlice, eighthSlice, seventhSlice, sixthSlice, fiveSlice, fourthSlice, thirdSlice, secondSlice, firstSlice ])
                                     
            self.slices = exitRay.slices
                                    
            self.exitAmount = {
            return [Ray(slices: [ninthSlice, eighthSlice, seventhSlice, sixthSlice, fiveSlice, fourthSlice, thirdSlice, secondSlice, firstSlice ])]
            }()
                
        default:
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
                      
             self.exitRay = Ray(slices: [fourth, third, second, first ])
             
            self.slices = exitRay.slices
            
             self.exitAmount = {
                 return [Ray(slices: [fourth, third, second, first ])]
             }()
            
        }
        
    }
    func oneMore(nameOfRays:String) {
        switch rayName {
              case "Луч Земли":
                earthAmount.insert(self.earthRay, at: 0)
               case "Луч Человека":
                humanAmount.insert(self.humanRay, at: 0)
               case "Луч Возврата":
                returnAmount.insert(self.returnRay, at: 0)
               case "Луч Выхода":
                exitAmount.insert(self.exitRay, at: 0)
                 
                     
             default:
                //сюда вместо х нужен обрабочик ошибок
                var x = 0
                    x += 0
         }
    }
    func amount(nameOfRays:String)->Int{
        switch rayName {
            case "Луч Земли":
                return earthAmount.count
            case "Луч Человека":
                return humanAmount.count
            case "Луч Возврата":
                return returnAmount.count
            case "Луч Выхода":
                return exitAmount.count
                    
            default:
                return 0
        }
    }
    
   

}
