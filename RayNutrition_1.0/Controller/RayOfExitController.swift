//
//  ViewController.swift
//  RayOfReturn
//
//  Created by LA'D on 23.01.2020.
//  Copyright © 2020 Garonum. All rights reserved.
//

import UIKit

class RayOfExitController:BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {

    var slices: [RayOfRays] = {

        
        var ninthSlice = RayOfRays()
        ninthSlice.productsName = "Семена"
        ninthSlice.platName = "Плат Эффект"
        ninthSlice.directionOfObservation = "ЫЙИ-нить"
        
        var eighthSlice = RayOfRays()
        eighthSlice.productsName = "Семена"
        eighthSlice.platName = "Плат Эффект"
        eighthSlice.directionOfObservation = "ЫЙИ-нить"
        
        var seventhSlice = RayOfRays()
        seventhSlice.productsName = "Семена"
        seventhSlice.platName = "Плат Эффект"
        seventhSlice.directionOfObservation = "ЫЙИ-нить"
        //seventhSlice.numberOfViews = 57989654934
        
        var sixthSlice = RayOfRays()
        sixthSlice.productsName = "Зерна"
        sixthSlice.platName = "Плат Вселенский"
        sixthSlice.directionOfObservation = "Ритмологический рисунок из ЫЙИ"
        
        var fiveSlice = RayOfRays()
        fiveSlice.productsName = "Плоды"
        fiveSlice.platName = "Плат Знаний"
        fiveSlice.directionOfObservation = "Книга Озаригн"
        
        var fourthSlice = RayOfRays()
        fourthSlice.productsName = "Цветы, мед"
        fourthSlice.platName = "Плат Любви"
        fourthSlice.directionOfObservation = "Книга Радастея"
        
        var thirdSlice = RayOfRays()
        thirdSlice.productsName = "Листья"
        thirdSlice.platName = "Плат Славы"
        thirdSlice.directionOfObservation = "Книга Ирлем"
        
        var secondSlice = RayOfRays()
        secondSlice.productsName = "Стебель"
        secondSlice.platName = "Плат Денег"
        secondSlice.directionOfObservation = "Ритмический рисунок из ЫЙИ"
        
        var firstSlice = RayOfRays()
        firstSlice.productsName = "Корень"
        firstSlice.platName = "Плат Стыда"
        firstSlice.directionOfObservation = "ЫЙИ"
        
        //sixthSlice.numberOfViews = 57989654934
        
        return [ninthSlice, eighthSlice, seventhSlice, sixthSlice, fiveSlice, fourthSlice, thirdSlice, secondSlice, firstSlice ]
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
          
          let cellId = "cellId"
          
          override func setupViews() {
              super.setupViews()
              addSubview(collectionView)
              addConstraintsWithFormat( "H:|[v0]|", views: collectionView)
              addConstraintsWithFormat( "V:|[v0]|", views: collectionView)
              
              collectionView.register(RayCell.self, forCellWithReuseIdentifier: cellId)
              collectionView.register(ExitHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
            
               collectionView.register(TimeFactor.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "Footer")
              
              collectionView.backgroundColor = UIColor.green
          }


}

extension RayOfExitController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return slices.count
        }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! RayCell
                   cell.backgroundColor = UIColor.yellow
                   cell.rayOfReturn = slices[indexPath.item]
            
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
