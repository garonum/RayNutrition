//
//  ViewController.swift
//  RayOfReturn
//
//  Created by LA'D on 23.01.2020.
//  Copyright © 2020 Garonum. All rights reserved.
//

import UIKit

class RayOfEarthController:BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    
    let cellId = "cellId"

    var slices: [RayOfRays] = {
        
        var fourthSlice = RayOfRays()
        fourthSlice.productsName = "Фрукты, ягоды, сметана"
        fourthSlice.platName = "Звездный План"
        fourthSlice.directionOfObservation = "Будущее"
        
        var thirdSlice = RayOfRays()
        thirdSlice.productsName = "Овощи, сливочное масло"
        thirdSlice.platName = "План Солнца"
        thirdSlice.directionOfObservation = "Настоящее"
        
        var secondSlice = RayOfRays()
        secondSlice.productsName = "Растительный белок, растительное масло"
        secondSlice.platName = "План Человека"
        secondSlice.directionOfObservation = "Прошлое"
        
        var firstSlice = RayOfRays()
        firstSlice.productsName = "Белок(Рыба, морепродукты), рыбий жир)"
        firstSlice.platName = "План Земли"
        firstSlice.directionOfObservation = "Подсказки"
        
        //sixthSlice.numberOfViews = 57989654934
        
        return [fourthSlice, thirdSlice, secondSlice, firstSlice ]
    }()
    var slices1: [RayOfRays] = {
           
           var fourthSlice = RayOfRays()
           fourthSlice.productsName = "Фрты, ягды, сметана"
           fourthSlice.platName = "Звездный План"
           fourthSlice.directionOfObservation = "Будущее"
           
           var thirdSlice = RayOfRays()
           thirdSlice.productsName = "Овощи, сливочное масло"
           thirdSlice.platName = "План Солнца"
           thirdSlice.directionOfObservation = "Настоящее"
           
           var secondSlice = RayOfRays()
           secondSlice.productsName = "Растительный белок, растительное масло"
           secondSlice.platName = "План Человека"
           secondSlice.directionOfObservation = "Прошлое"
           
           var firstSlice = RayOfRays()
           firstSlice.productsName = "Белок(Рыба, морепродукты), рыбий жир)"
           firstSlice.platName = "План Земли"
           firstSlice.directionOfObservation = "Подсказки"
           
           //sixthSlice.numberOfViews = 57989654934
           
           return [fourthSlice, thirdSlice, secondSlice, firstSlice ]
       }()
    
   lazy var collectionView: UICollectionView = {
         let layout = UICollectionViewFlowLayout()
         layout.sectionInset = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
         let cv = UICollectionView(frame: .zero, collectionViewLayout: layout )
         cv.backgroundColor = UIColor.white
         cv.dataSource = self
         cv.delegate = self
         return cv
     }()
   public func reloading(){
       slices.insert(slices1[0], at: 0)
        self.collectionView.reloadData()
    }
    func oneMore(){
        
        slices.insert(slices1[0], at: 0)
    }
    func printing(){
        //print(slices.count)
    }
     
     override func setupViews() {
         super.setupViews()
        
         addSubview(collectionView)
        
        addConstraintsWithFormat( "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat( "V:|[v0]|", views: collectionView)
        
         
         
         collectionView.register(RayCell.self, forCellWithReuseIdentifier: cellId)
         collectionView.register(EarthHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
          collectionView.register(TimeFactor.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "Footer")
         
         collectionView.backgroundColor = UIColor.green
        reloading()
     }
   

}

extension RayOfEarthController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return slices.count
        }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! RayCell
        print(slices.count)
                    cell.backgroundColor = UIColor.yellow
                    cell.rayOfReturn = slices[indexPath.item]
                    cell.row = indexPath.item
                    
                    cell.contentView.layer.cornerRadius = 2.0
                    cell.contentView.layer.borderWidth = 1.0
                    cell.contentView.layer.borderColor = UIColor.clear.cgColor
                    cell.contentView.layer.masksToBounds = true;

                    cell.layer.shadowColor = UIColor.lightGray.cgColor
                    cell.layer.shadowOffset = CGSize(width:0,height: 2.0)
                    cell.layer.shadowRadius = 2.0
                    cell.layer.shadowOpacity = 1.0
                    cell.layer.masksToBounds = false;
                    cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
               
            return cell
    }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         return CGSize(width: self.frame.width-80, height: 80)
     }
    
     func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
          
          if kind == UICollectionView.elementKindSectionHeader {
              let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath)
              header.backgroundColor = .blue
                
              return header
          } else {
              let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Footer", for: indexPath)
              footer.backgroundColor = .green
              return footer
          }
      }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
           return CGSize(width: self.frame.width, height: 50)
        }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
           return CGSize(width: self.frame.width, height: 100)
        }
     
}
