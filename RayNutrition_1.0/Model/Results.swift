//
//  Results.swift
//  RayNutrition_1.0
//
//  Created by LA'D on 14.04.2020.
//  Copyright © 2020 Garonum. All rights reserved.
//

import UIKit

class Results {
    var dataForResultEa:[Result]=[]
    let dataForResultH:[[Result]]=[]
    let dataForResultR:[[Result]]=[]
    let dataForResultEx:[[Result]]=[]
    
    
}
class Result: Results{
    var rayName:String? = nil
    var rowNumber:Int? = nil
    var sectionNumber:Int = 0
    
    func saveRayCoefficient(rayName: String, rowNumber: Int, sectionNumber: Int){
            switch rayName {
                      case "Луч Земли":
                        repeatCheck(rayName: rayName, sectionNumber: sectionNumber)
                        let ea=Result()
                        ea.rayName = rayName
                        ea.rowNumber = rowNumber
                        ea.sectionNumber = sectionNumber
                        super.dataForResultEa.insert(ea, at: dataForResultEa.count)
                
            case "Луч Человека": break
                          //return humanAmount.count
            case "Луч Возврата": break
                          //return returnAmount.count
            case "Луч Выхода": break
                          //return exitAmount.count

            default: break
                          //return 0
                  }
        }
        func repeatCheck(rayName: String,sectionNumber: Int){
            guard dataForResultEa.count > 0 else {
                return
            }
            //print(dataForResultEa[0].sectionNumber)
            
            for item in 0...super.dataForResultEa.count-1{
                print("-")
                //print(item)
               // print(dataForResultEa[item].sectionNumber)
                print(super.dataForResultEa.count)
                print("-_")
    //            print(dataForResultEa[0][0].rowNumber)
    //            print("__")
            }
        }
    
}
