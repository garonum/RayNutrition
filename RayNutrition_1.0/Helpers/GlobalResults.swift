//
//  GlobalResults.swift
//  RayNutrition_1.0
//
//  Created by LA'D on 01.05.2020.
//  Copyright © 2020 Garonum. All rights reserved.
//

import UIKit

class GlobalResult {
    var eSelectedIntervals: [IndexPath] = []
    var eSelectedSlices : [IndexPath?] = []
    var hSelectedIntervals: [IndexPath] = []
    var hSelectedSlices : [IndexPath?] = []
    var exSelectedIntervals: [IndexPath] = []
    var exSelectedSlices : [IndexPath?] = []
    var rSelectedIntervals: [IndexPath] = []
    var rSelectedSlices : [IndexPath?] = []
    
//    if rayName == "Луч Земли"{
//
//               }
//               if rayName == "Луч  Человека" {
//
//               }
//               if rayName == "Луч  Возврата" {
//
//                    }
//               if rayName == "Луч Выхода" {
//
//                    }
//    print(G_Res.eSelectedIntervals)
//              print(G_Res.eSelectedSlices)
//               print(G_Res.hSelectedIntervals)
//               print(G_Res.hSelectedSlices)
//               print(G_Res.rSelectedIntervals)
//               print(G_Res.rSelectedSlices)
//               print(G_Res.exSelectedIntervals)
//               print(G_Res.exSelectedSlices)

    
    func oneMoreSI(indexPath: IndexPath, rayName:String){
        
        if rayName == "Луч Земли"{
            var check = false
                 //var save = 0
                 
                 if eSelectedIntervals.count > 0 {
                     for item in 0...eSelectedIntervals.count-1{
                         if indexPath.section == eSelectedIntervals[item].section{
                                    check = true
                    
                                }
                            }
                    if check == false {
                        eSelectedIntervals.append(indexPath)
                    }
                 }else{
                    eSelectedIntervals.append(indexPath)
                    
                }
            
        }
        if rayName == "Луч Человека" {
            var check = false
                        //var save = 0
                        
           
                if hSelectedIntervals.count > 0 {
                    for item in 0...hSelectedIntervals.count-1{
                        if indexPath.section == hSelectedIntervals[item].section{
                                   check = true
                   
                               }
                           }
                   if check == false {
                       hSelectedIntervals.append(indexPath)
                   }
                }else{
                   hSelectedIntervals.append(indexPath)
                           
            }
        }
        if rayName == "Луч Возврата" {
                       var check = false
                                   //var save = 0
                                   
                           if rSelectedIntervals.count > 0 {
                               for item in 0...rSelectedIntervals.count-1{
                                   if indexPath.section == rSelectedIntervals[item].section{
                                              check = true
                              
                                          }
                                      }
                              if check == false {
                                  rSelectedIntervals.append(indexPath)
                              }
                           }else{
                              rSelectedIntervals.append(indexPath)
                                      
                       }
                   }
        if rayName == "Луч Выхода" {
                 var check = false
                             //var save = 0
                             
                     if exSelectedIntervals.count > 0 {
                         for item in 0...exSelectedIntervals.count-1{
                             if indexPath.section == exSelectedIntervals[item].section{
                                        check = true
                        
                                    }
                                }
                        if check == false {
                            exSelectedIntervals.append(indexPath)
                        }
                     }else{
                        exSelectedIntervals.append(indexPath)
                                
                 }
             }
      
    }
    
    
    
    func selectInterval(indexPath: IndexPath, rayName:String){
        print(rayName)
        
                if rayName == "Луч Земли"{
                   guard eSelectedIntervals.count > 0 else {
                           return
                       }
                                     
                       for item in 0...eSelectedIntervals.count-1{
                           if eSelectedIntervals[item].section == indexPath.section{
                               eSelectedIntervals.remove(at: item)
                               eSelectedIntervals.append(indexPath)
                               
                           }
                       }
               }
               if rayName == "Луч Человека" {
                    guard hSelectedIntervals.count > 0 else {
                            return
                        }
                                      
                        for item in 0...hSelectedIntervals.count-1{
                            if hSelectedIntervals[item].section == indexPath.section{
                                hSelectedIntervals.remove(at: item)
                                hSelectedIntervals.append(indexPath)
                                
                            }
                        }
               }
         
               if rayName == "Луч Возврата" {
                        guard rSelectedIntervals.count > 0 else {
                                return
                            }
                                          
                            for item in 0...rSelectedIntervals.count-1{
                                if rSelectedIntervals[item].section == indexPath.section{
                                    rSelectedIntervals.remove(at: item)
                                    rSelectedIntervals.append(indexPath)
                                    
                                }
                            }
                    }
            if rayName == "Луч Выхода" {
                      guard exSelectedIntervals.count > 0 else {
                              return
                          }
                                        
                          for item in 0...exSelectedIntervals.count-1{
                              if exSelectedIntervals[item].section == indexPath.section{
                                  exSelectedIntervals.remove(at: item)
                                  exSelectedIntervals.append(indexPath)
                                  
                              }
                          }
                          }
    
        
    }
//    func allreadyExist(cur:Int)->Bool{
//              var check = 0
//          for item in 0...G_Res.eSelectedSlices.count-1{
//              if cur == G_Res.eSelectedSlices[item]?.section{
//                      check=1
//                  }
//              }
//              if check > 0{
//                  return true
//              }else{
//                  return false
//              }
//          }
    
 
    
}
var G_Res = GlobalResult()

