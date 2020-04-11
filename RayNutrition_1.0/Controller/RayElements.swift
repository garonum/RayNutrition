//
//  RayElements.swift
//  RayNutrition_1.0
//
//  Created by LA'D on 09.04.2020.
//  Copyright © 2020 Garonum. All rights reserved.
//

import Foundation

struct RayElements {
 
    var productsName: String?
      var platName: String?
      var directionOfObservation: String?
 
   // Constructor.
    init(rayName:String, className:String, obj:String) {
      self.productsName = rayName;
      self.platName = className;
      self.directionOfObservation = obj;
  }
 
}
