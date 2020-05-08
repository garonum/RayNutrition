////
////  ViewController.swift
////  RayOfReturn
////
////  Created by LA'D on 23.01.2020.
////  Copyright © 2020 Garonum. All rights reserved.
////
//
//import UIKit
//
//class RayOfEarthController:BaseCell, 
//UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
//
//    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
//
//    let rayName = "Луч Земли"
//    
//   lazy var collectionView: UICollectionView = {
//         let layout = UICollectionViewFlowLayout()
//         //layout.sectionInset = UIEdgeInsets(top: 15, left: 0, bottom: 250, right: 0)
//         let cv = UICollectionView(frame: .zero, collectionViewLayout: layout )
//         cv.backgroundColor = UIColor.white
//         cv.dataSource = self
//         cv.delegate = self
//         return cv
//     }()
//    
//     override func setupViews() {
//         super.setupViews()
//        
//         addSubview(collectionView)
//
//        addConstraintsWithFormat( "H:|[v0]|", views: collectionView)
//        addConstraintsWithFormat( "V:|[v0]|", views: collectionView)
//
//        collectionView.register(EarthHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
//        collectionView.register(RayCell.self, forCellWithReuseIdentifier: rayName)
//        collectionView.register(EaTimeFactor.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter , withReuseIdentifier: "Footer")
//       
//         collectionView.backgroundColor = UIColor.green
//         collectionView.allowsMultipleSelection = true
//      
//        NotificationCenter.default.addObserver(self, selector: #selector(loadList(notification:)), name: NSNotification.Name(rawValue: rayName), object: nil)
//        
//     }
//
//}
//
//extension RayOfEarthController {
//   
//    @objc func loadList(notification: NSNotification) {
//        
//        rayOfEarth.oneMore(nameOfRays: rayName)
//     
//        self.collectionView.reloadData()
//    
//                  // восстановление выбранных ранее элементов (после перезагрузки все выбранное слетает)
//          if G_Res.selectedSlices.count > 0 { // смотрим выбирал ли юзер срез ранее
//              for i in 0...rayOfEarth.amount(nameOfRays: rayName){// проверяются все лучи одного вида(например луч земли)
//                  for y in 0...rayOfEarth.slices.count{ // все срезы устанавливаются в положение deselected
//                      self.collectionView.deselectItem(at: [i,y], animated: false)
//  
//                  }
//  
//                                }
//              for i in G_Res.selectedSlices { // все выбранное ранее
//                  self.collectionView.selectItem(at: i, animated: false, scrollPosition: .centeredHorizontally)
//  
//              }
//  
//          }
//        
//        self.collectionView.scrollToItem(at: [rayOfEarth.amount(nameOfRays: rayName)-1,0], at: .top, animated: .init(booleanLiteral: true))
//    }
//    
//    func allreadyClicked(cur:Int)->Bool{
//        // используется в didSelectItemAt
//        //нужна для правльного выделения срезов
//        var check = 0
//        for item in 0...G_Res.selectedSlices.count-1{
//            if cur == G_Res.selectedSlices[item]?.section{
//                check=1
//            }
//        }
//        if check > 0{
//            return true
//        }else{
//            return false
//        }
//    }
//   
//}
//
//extension RayOfEarthController {
//    
//     func numberOfSections(in collectionView: UICollectionView) -> Int {
//        
//        return super.rayOfEarth.amount(nameOfRays: rayName)
//        
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//            return rayOfEarth.slices.count
//        }
//        
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: rayName, for: indexPath) as! RayCell
//        
//                    cell.backgroundColor = UIColor.yellow
//                    cell.slice = rayOfEarth.slices[indexPath.row]
//                    cell.row = indexPath.row
//                    cell.section = indexPath.section
//                    cell.rayName = rayName
//
//                    cell.contentView.layer.cornerRadius = 2.0
//                    cell.contentView.layer.borderWidth = 1.0
//                    cell.contentView.layer.borderColor = UIColor.clear.cgColor
//                    cell.contentView.layer.masksToBounds = true;
//
//                    cell.layer.shadowColor = UIColor.lightGray.cgColor
//                    cell.layer.shadowOffset = CGSize(width:0,height: 2.0)
//                    cell.layer.shadowRadius = 2.0
//                    cell.layer.shadowOpacity = 1.0
//                    cell.layer.masksToBounds = false;
//                    cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
//       
//            return cell
//    }
//    
//     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if G_Res.selectedSlices.count > 0 {
//            for item in 0...G_Res.selectedSlices.count-1{
//                if indexPath.section == G_Res.selectedSlices[item]?.section{
//                   
//                    for i in 0...super.rayOfEarth.slices.count{
//                        self.collectionView.deselectItem(at: [indexPath.section,i], animated: false)
//                        
//                         
//                    }
//                    G_Res.selectedSlices.remove(at: item)
//                    G_Res.selectedSlices.append(indexPath)
//                    
//                    self.collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .centeredHorizontally)
//                    
//                }else{
//                    if allreadyClicked(cur: indexPath.section) == false{
//                        for i in 0...rayOfEarth.slices.count{
//                            self.collectionView.deselectItem(at: [indexPath.section,i], animated: false)
//
//                        }
//                        G_Res.selectedSlices.append(indexPath)
//                        self.collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .centeredHorizontally)
//                    }
//
//                }
//               
//            }
//        }else{
//            G_Res.selectedSlices.append(indexPath)
//        }
//        print(G_Res.selectedSlices)
//      for item in G_Res.selectedSlices{
//                if item?.section == 1{
//                    print("ok")
//                }
//                print(item?.section as Any)
//            }
//        
//    }
//    
//  
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        insetForSectionAt section: Int) -> UIEdgeInsets {
//      return sectionInsets
//    }
//    
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//      return sectionInsets.left
//    }
//    
//     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//         return CGSize(width: self.frame.width-80, height: 80)
//     }
//    
//     func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
// 
//          if kind == UICollectionView.elementKindSectionHeader {
//
//              guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as? EarthHeader
//            else {
//                     fatalError("Invalid view type")
//                 }
//              header.backgroundColor = .blue
//              return header
//          } else {
//            
//              guard let footer = collectionView.dequeueReusableSupplementaryView(
//                ofKind: kind,
//                withReuseIdentifier: "Footer",
//                for: indexPath) as? EaTimeFactor
//                else{
//                    fatalError("Invalid view type")
//            }
//          
//            footer.gradeTextField.tag = indexPath.section
//            G_Res.oneMoreSI(indexPath: indexPath)
//            
//              footer.backgroundColor = .green
//              return footer
//          }
//      }
//        
//    
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//           return CGSize(width: self.frame.width, height: 50)
//        }
//    
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//            return CGSize(width: self.frame.width, height: 150)
//        }
//    
//     
//     
//}
//
//
//
