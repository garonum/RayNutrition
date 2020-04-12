//
//  ViewController.swift
//  RayOfReturn
//
//  Created by LA'D on 23.01.2020.
//  Copyright © 2020 Garonum. All rights reserved.
//

import UIKit

class RayOfEarthController:BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    let cellId = "cellId"
    let rayOfEarth = Rays(rayName: "r")
   // let rayOfEarth: Rays? = nil
    var slices: [Ray] = {
        
        var fourth = Slices()
        fourth.productsName = "Фрукты, ягоды, сметана"
        fourth.platName = "Звездный План"
        fourth.directionOfObservation = "Будущее"
        
        var third = Slices()
        third.productsName = "Овощи, сливочное масло"
        third.platName = "План Солнца"
        third.directionOfObservation = "Настоящее"
        
        var second = Slices()
        second.productsName = "Растительный белок, растительное масло"
        second.platName = "План Человека"
        second.directionOfObservation = "Прошлое"
        
        var first = Slices()
        first.productsName = "Белок(Рыба, морепродукты), рыбий жир)"
        first.platName = "План Земли"
        first.directionOfObservation = "Подсказки"
        
        //sixthSlice.numberOfViews = 57989654934
        let ray = Ray(slices: [fourth, third, second, first ])
        return [ray]
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
//       slices.insert(slices[0], at: 0)
//    print(slices.count)
//        self.collectionView.reloadData()
    }
    
    func oneMore(){
        slices.insert(slices[0], at: 0)
        //slices.insert(slices[0], at: 0)
    }
    
    func printing(){
        //print(slices.count)
    }
     
     override func setupViews() {
         super.setupViews()
         addSubview(collectionView)
        
        
        
         //let x = [slices,slices1]
        
        //rays.insert(rays.ray, at: <#T##Int#>)
        addConstraintsWithFormat( "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat( "V:|[v0]|", views: collectionView)
        
         
//        collectionView.register(SupView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: "someRandonIdentifierString")
        collectionView.register(SupView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: "someRandonIdentifierString")
         collectionView.register(RayCell.self, forCellWithReuseIdentifier: cellId)
         collectionView.register(EarthHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
          collectionView.register(TimeFactor.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "Footer")
         
         collectionView.backgroundColor = UIColor.green
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadList(notification:)), name: NSNotification.Name(rawValue: "load"), object: nil)
     }
   @objc func loadList(notification: NSNotification) {
        oneMore()
     self.collectionView.reloadData()
    
   }

}

extension RayOfEarthController {
    
     func numberOfSections(in collectionView: UICollectionView) -> Int {
        return slices.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rayOfEarth.slices.count
        }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! RayCell
        //print(rayOfEarth.amount)
        
                    cell.backgroundColor = UIColor.yellow
        cell.rayOfReturn = slices[0].slices[indexPath.row]
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
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
      return sectionInsets
    }
    
    // 4
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
      return sectionInsets.left
    }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         return CGSize(width: self.frame.width-80, height: 80)
     }
    
     func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

         
          if kind == UICollectionView.elementKindSectionHeader {
            let someView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "someRandonIdentifierString", for: indexPath) as! SupView
            return someView
//              let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath)
//              header.backgroundColor = .blue
//
//              return header
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
class SupView: UICollectionReusableView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.myCustomInit()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.myCustomInit()
    }

    func myCustomInit() {
        
         let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
            button.backgroundColor = .green
            button.setTitle("Test Button", for: .normal)
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

            addSubview(button)
    }
    @objc func buttonAction(sender: UIButton!) {
      print("Button tapped")
    }

}
