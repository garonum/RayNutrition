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
    
    var eCoefficentRaySlice = [27,20,14,7]
    var hCoefficentRaySlice = [27,23,18,14,9,5]
    var exCoefficentRaySlice = [27,20,14,7]
    var rCoefficentRaySlice = [27,20,14,7]
    var timeFactor = [13,12,11,10,9,8,7,6,5,4,3,2,1]
    
//    func saveRayCoefficient(rayName: String, rowNumber: Int, sectionNumber: Int){
//            switch rayName {
//                      case "Луч Земли":
//                        repeatCheck(rayName: rayName, sectionNumber: sectionNumber)
//                        let ea=Result()
//                        ea.rayName = rayName
//                        ea.rowNumber = rowNumber
//                        ea.sectionNumber = sectionNumber
//                        super.dataForResultEa.insert(ea, at: dataForResultEa.count)
//
//            case "Луч Человека": break
//                          //return humanAmount.count
//            case "Луч Возврата": break
//                          //return returnAmount.count
//            case "Луч Выхода": break
//                          //return exitAmount.count
//
//            default: break
//                          //return 0
//                  }
//        }
//    func repeatCheck(rayName: String,sectionNumber: Int){
//        guard dataForResultEa.count > 0 else {
//            return
//        }
//        
//    }
//        for item in 0...super.dataForResultEa.count-1{
//
//        }
    
    
    func finalResult(row:Int) -> Int{
       //var selectedSlices = G_Res.curentRay(rayName: rayName)[1]
        var emissivity = 0
       print(row)

        if row == 0{
            for secSlice in G_Res.eSelectedSlices{
                for secInt in G_Res.eSelectedIntervals{
                    if secSlice?.section == secInt.section {
                       
                        emissivity += eCoefficentRaySlice[secSlice!.row] * timeFactor[secInt.row]
                        
                    }
                }
                
            }
        }
        if row == 1{
            for secSlice in G_Res.hSelectedSlices{
                for secInt in G_Res.hSelectedIntervals{
                    if secSlice?.section == secInt.section {
                        
                        emissivity += eCoefficentRaySlice[secSlice!.row] * timeFactor[secInt.row]
                    }
                }
                
            }
        }
      
                if row == 2{
            for secSlice in G_Res.rSelectedSlices{
                for secInt in G_Res.rSelectedIntervals{
                    if secSlice?.section == secInt.section {
                        
                        emissivity += eCoefficentRaySlice[secSlice!.row] * timeFactor[secInt.row]
                        print(emissivity)
                    }
                }
                
            }
        }
        if row == 3{
                  for secSlice in G_Res.exSelectedSlices{
                      for secInt in G_Res.exSelectedIntervals{
                          if secSlice?.section == secInt.section {
              
                              emissivity += eCoefficentRaySlice[secSlice!.row] * timeFactor[secInt.row]
                          }
                      }
                      
                  }
              }
        return emissivity
    
    }
    
}
