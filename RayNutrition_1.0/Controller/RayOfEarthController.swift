//
//  ViewController.swift
//  RayOfReturn
//
//  Created by LA'D on 23.01.2020.
//  Copyright © 2020 Garonum. All rights reserved.
//

import UIKit

class RayOfEarthController:BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    var sel : [IndexPath?] = []
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)

    let rayName = "Луч Земли"
    let rayOfEarth = Rays(rayName: "Луч Земли")

   lazy var collectionView: UICollectionView = {
         let layout = UICollectionViewFlowLayout()
         layout.sectionInset = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
         let cv = UICollectionView(frame: .zero, collectionViewLayout: layout )
         cv.backgroundColor = UIColor.white
         cv.dataSource = self
         cv.delegate = self
         return cv
     }()
     
     override func setupViews() {
         super.setupViews()
         addSubview(collectionView)
    
        
        addConstraintsWithFormat( "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat( "V:|[v0]|", views: collectionView)

//        collectionView.register(SupView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: "someRandonIdentifierString")
//        collectionView.register(SupView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: "someRandonIdentifierString")
         collectionView.register(RayCell.self, forCellWithReuseIdentifier: rayName)
         collectionView.register(EarthHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
          collectionView.register(EaTimeFactor.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "Footer")
         
         collectionView.backgroundColor = UIColor.green
        collectionView.allowsMultipleSelection = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadList(notification:)), name: NSNotification.Name(rawValue: rayName), object: nil)
     }
   @objc func loadList(notification: NSNotification) {
        
    rayOfEarth.oneMore(nameOfRays: rayName)
       self.collectionView.reloadData()
        if sel.count > 0 {
            for i in 0...rayOfEarth.amount(nameOfRays: rayName){
                for y in 0...rayOfEarth.slices.count{
                    self.collectionView.deselectItem(at: [i,y], animated: false)
                    
                }
                                  
                              }
            for i in sel{
                self.collectionView.selectItem(at: i, animated: false, scrollPosition: .centeredHorizontally)
                
            }
           
        }
    self.collectionView.scrollToItem(at: [rayOfEarth.amount(nameOfRays: rayName)-1,0], at: .top, animated: .init(booleanLiteral: true))
    
    
    
//               if indexPath.section == i?.section ?? 112{
//
//                   self.collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .centeredHorizontally)
//
//               }
              
          
    
      

   }

}

extension RayOfEarthController {
    
     func numberOfSections(in collectionView: UICollectionView) -> Int {

        return rayOfEarth.amount(nameOfRays: rayName)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rayOfEarth.slices.count
        }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: rayName, for: indexPath) as! RayCell
        
                    cell.backgroundColor = UIColor.yellow
                    cell.rayOfReturn = rayOfEarth.slices[indexPath.row]
                    cell.row = indexPath.row
                    cell.section = indexPath.section
                    cell.rayName = rayName

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
//            let someView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "someRandonIdentifierString", for: indexPath) as! SupView
//            return someView
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

extension RayOfEarthController {
    func allreadyClicked(cur:Int)->Bool{
        var check = 0
        for item in 0...sel.count-1{
            if cur == sel[item]?.section ?? 112{
                check=1
            }
        }
        if check > 0{
            return true
        }else{
            return false
        }
    }
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //sel.append([0,3])
        mainInstance.name += "122"
        print(mainInstance.name ?? "42")
        
        if sel.count > 0 {//print("1")
            for item in 0...sel.count-1{//print("2")
                if indexPath.section == sel[item]?.section ?? 112{//print("3")
                    
                   
                    for i in 0...rayOfEarth.slices.count{//print("4")
                        self.collectionView.deselectItem(at: [indexPath.section,i], animated: false)
                        
                         
                    }
                    sel.remove(at: item)
                    sel.append(indexPath)
                    
                    self.collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .centeredHorizontally)
                    
                }else{//print("5")
                    if allreadyClicked(cur: indexPath.section) == false{
                        for i in 0...rayOfEarth.slices.count{//print("6")
                            self.collectionView.deselectItem(at: [indexPath.section,i], animated: false)

                        }
                        sel.append(indexPath)
                        self.collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .centeredHorizontally)
                    }

                }
               
            }
        }else{//print("7")
            sel.append(indexPath)
        }
        print(sel)
        
        
        //sel.append(indexPath)
        //print(sel)
        
        //
//        self.collectionView.selectItem(at: sel[0], animated: false, scrollPosition: .top)
//        self.collectionView.deselectItem(at: [0,0], animated: false)
//        self.collectionView.deselectItem(at: [0,2], animated: false)
//        self.collectionView.deselectItem(at: [0,3], animated: false)
        //self.collectionView.reloadData()
        
    }
   
}

//class SupView: UICollectionReusableView {
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.myCustomInit()
//    }
//
//    required init(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)!
//        self.myCustomInit()
//    }
//
//    func myCustomInit() {
//        
//         let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
//            button.backgroundColor = .green
//            button.setTitle("Test Button", for: .normal)
//            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
//
//            addSubview(button)
//    }
//    @objc func buttonAction(sender: UIButton!) {
//      print("Button tapped")
//    }
//
//}
