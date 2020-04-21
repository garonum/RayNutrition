//
//  DPCounter.swift
//  RayNutrition_1.0
//
//  Created by LA'D on 20.04.2020.
//  Copyright © 2020 Garonum. All rights reserved.
//

import Foundation
class DPCounter {
    var t:DPCounter
       
       init(t: DPCounter) {
           self.t = t
           
       }
       
       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
   
}
class Main {
  var name:String
  init(name:String) {
    self.name = name
  }
}
var mainInstance = Main(name:"My Global Class")
