//
//  GlobalResults.swift
//  RayNutrition_1.0
//
//  Created by LA'D on 01.05.2020.
//  Copyright © 2020 Garonum. All rights reserved.
//

import UIKit

class GlobalResult {
    var selectedIntervals: [IndexPath] = []
    var selectedSlices : [IndexPath?] = []
    
    func oneMoreSI(indexPath: IndexPath){
        var check = false
             //var save = 0
             
             if selectedIntervals.count > 0 {
                 for item in 0...selectedIntervals.count-1{
                     if indexPath.section == selectedIntervals[item].section{
                                check = true
                
                            }
                        }
                if check == false {
                    selectedIntervals.append(indexPath)
                }
             }else{
                selectedIntervals.append(indexPath)
                
            }
        print(selectedIntervals)
    }
    func selectInterval(){
        
    }
    func allreadyExist(cur:Int)->Bool{
              var check = 0
          for item in 0...G_Res.selectedSlices.count-1{
              if cur == G_Res.selectedSlices[item]?.section{
                      check=1
                  }
              }
              if check > 0{
                  return true
              }else{
                  return false
              }
          }
    
    
}
var G_Res = GlobalResult()

