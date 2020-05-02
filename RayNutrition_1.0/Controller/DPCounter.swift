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
//var mainInstance = Main(name:"My Global Class")


//class SupView: UICollectionReusableView {
//var x = 0
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.myCustomInit()
//    }
//
//    required init(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)!
//        self.myCustomInit()
//    }
////    override func prepareForReuse() {
////
////
//////       imageView.image = lowResolutionImage
//////       highResolutionImage = nil
////    }
//    let titleLabel: UILabel = {
//           let label = UILabel()
//           label.translatesAutoresizingMaskIntoConstraints = false
//           label.text = "Луч Земли"
//           label.numberOfLines = 2
//           label.textColor = UIColor.white
//           return label
//       }()
//    func myCustomInit() {
//        
//         let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
//            button.backgroundColor = .green
//            button.setTitle("Test Button", for: .normal)
//            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
//
//            addSubview(button)
//        addSubview(titleLabel)
//        
//    }
//    @objc func buttonAction(sender: UIButton!) {
//        super.prepareForReuse()
//        NotificationCenter.default.post(name: NSNotification.Name("Луч Земли"), object: self, userInfo: ["N":0])
//
//      
//
//      //print("Button tapped")
//    }
//      
//
//}
//
//
//
//
