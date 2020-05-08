//
//  UniversalRayConroller.swift
//  RayNutrition_1.0
//
//  Created by LA'D on 07.05.2020.
//  Copyright © 2020 Garonum. All rights reserved.
//

import UIKit

class UniversalRayController:BaseCell,
UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {

private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    var RayN:String? {
       didSet {
           
        rayName = RayN ?? ""
           
           }
           
       }
    var rayData:Rays? {
    didSet {
        
     ray = rayData
        
        }
        
    }
    var rayName = "Луч Земли"
    var ray: Rays! = nil
  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
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

       collectionView.register(Header.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
    
       collectionView.register(UCell.self, forCellWithReuseIdentifier: rayName)
     collectionView.register(UCell.self, forCellWithReuseIdentifier:"Луч Человека")
    collectionView.register(UCell.self, forCellWithReuseIdentifier:"Луч Возврата")
    collectionView.register(UCell.self, forCellWithReuseIdentifier:"Луч Выхода")
       collectionView.register(TimeFactor.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter , withReuseIdentifier: "Footer")
      
        collectionView.backgroundColor = UIColor.green
        collectionView.allowsMultipleSelection = true
     
       NotificationCenter.default.addObserver(self, selector: #selector(loadList(notification:)), name: NSNotification.Name(rawValue: rayName), object: nil)
       
    }

}

extension UniversalRayController {

      @objc func loadList(notification: NSNotification) {
    
          ray.oneMore(nameOfRays: rayName)
       
          self.collectionView.reloadData()
      
                    // восстановление выбранных ранее элементов (после перезагрузки все выбранное слетает)
            if G_Res.eSelectedSlices.count > 0 { // смотрим выбирал ли юзер срез ранее
                for i in 0...ray.amount(nameOfRays: rayName){// проверяются все лучи одного вида(например луч земли)
                    for y in 0...ray.slices.count{ // все срезы устанавливаются в положение deselected
                        self.collectionView.deselectItem(at: [i,y], animated: false)
    
                    }
    
                                  }
                for i in G_Res.eSelectedSlices { // все выбранное ранее
                    self.collectionView.selectItem(at: i, animated: false, scrollPosition: .centeredHorizontally)
    
                }
    
            }
          
          self.collectionView.scrollToItem(at: [ray.amount(nameOfRays: rayName)-1,0], at: .top, animated: .init(booleanLiteral: true))
      }
    
    func allreadyClicked(cur:Int,rayName: String)->Bool{
         // используется в didSelectItemAt
         //нужна для правльного выделения срезов
       
        if rayName == "Луч Земли"{
                var check = 0
                        for item in 0...G_Res.eSelectedSlices.count-1{
                            if cur == G_Res.eSelectedSlices[item]?.section{
                                check=1
                            }
                        }
                        if check > 0{
                            return true
                        }else{
                            return false
                        }
           }
           if rayName == "Луч  Человека" {
            var check = 0
                    for item in 0...G_Res.hSelectedSlices.count-1{
                        if cur == G_Res.hSelectedSlices[item]?.section{
                            check=1
                        }
                    }
                    if check > 0{
                        return true
                    }else{
                        return false
                    }
           }
        if rayName == "Луч  Возврата" {
                  var check = 0
                          for item in 0...G_Res.rSelectedSlices.count-1{
                              if cur == G_Res.rSelectedSlices[item]?.section{
                                  check=1
                              }
                          }
                          if check > 0{
                              return true
                          }else{
                              return false
                          }
              }
           if rayName == "Луч Выхода" {
            var check = 0
                    for item in 0...G_Res.exSelectedSlices.count-1{
                        if cur == G_Res.exSelectedSlices[item]?.section{
                            check=1
                        }
                    }
                    if check > 0{
                        return true
                    }else{
                        return false
                    }
                }
         
        return false
     }
     
    
}

extension UniversalRayController {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return ray.amount(nameOfRays: rayName)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ray.slices.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        if rayName == "Луч Земли" {
//            var identifier: String
//            identifier = earthId
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Луч Земли", for: indexPath) as! UCell

             cell.backgroundColor = UIColor.yellow
        // тут вот тоже нужно будет как то указать, что в зависимости от выбора - в ray cell отправляем разные данные ...
             cell.slice = ray.slices[indexPath.row]
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
//            cell.RayN = "Луч Земли"
//            cell.rayData = rayOfEarth
             return cell
        }
            if rayName == "Луч Человека" {
            //var identifier: String
                   //identifier = humanId
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Луч Человека", for: indexPath) as! UCell

                cell.backgroundColor = UIColor.yellow
    // тут вот тоже нужно будет как то указать, что в зависимости от выбора - в ray cell отправляем разные данные ...
                cell.slice = ray.slices[indexPath.row]
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
    //                   cell.RayN = "Луч Человека"
    //                    cell.rayData = rayOfHuman
            return cell
               }
                       if rayName == "Луч Выхода" {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Луч Выхода", for: indexPath) as! UCell

                      cell.backgroundColor = UIColor.yellow
          // тут вот тоже нужно будет как то указать, что в зависимости от выбора - в ray cell отправляем разные данные ...
                      cell.slice = ray.slices[indexPath.row]
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
          //                   cell.RayN = "Луч Человека"
          //                    cell.rayData = rayOfHuman
                  return cell
                            }
                       if rayName == "Луч Возврата" {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Луч Возврата", for: indexPath) as! UCell

                      cell.backgroundColor = UIColor.yellow
          // тут вот тоже нужно будет как то указать, что в зависимости от выбора - в ray cell отправляем разные данные ...
                      cell.slice = ray.slices[indexPath.row]
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
          //                   cell.RayN = "Луч Человека"
          //                    cell.rayData = rayOfHuman
                  return cell
                            }
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: rayName, for: indexPath) as! UCell
        
                    cell.backgroundColor = UIColor.yellow
// тут вот тоже нужно будет как то указать, что в зависимости от выбора - в ray cell отправляем разные данные ...
                    cell.slice = ray.slices[indexPath.row]
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    
             if kind == UICollectionView.elementKindSectionHeader {
                 guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as? Header
               else {
                        fatalError("Invalid view type")
                    }
                 header.title =  rayName
                 header.backgroundColor = .blue
                 return header
             } else {

                 guard let footer = collectionView.dequeueReusableSupplementaryView(
                   ofKind: kind,
                   withReuseIdentifier: "Footer",
                   for: indexPath) as? TimeFactor
                   else{
                       fatalError("Invalid view type")
               }
             
               footer.gradeTextField.tag = indexPath.section
                footer.rN = rayName
                print(rayName)
                if rayName == "Луч Земли" {
                    G_Res.oneMoreSI(indexPath: indexPath, rayName: rayName)
                    
                }
                if rayName == "Луч Человека" {
                    G_Res.oneMoreSI(indexPath: indexPath, rayName: rayName)
                    
                }
                if rayName == "Луч Возврата" {
                    G_Res.oneMoreSI(indexPath: indexPath, rayName: rayName)
                    
                    
                }
                if rayName == "Луч Выхода" {
                    G_Res.oneMoreSI(indexPath: indexPath, rayName: rayName)
                    
                }
               
               
                 footer.backgroundColor = .green
                 return footer
             }
         }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
            if rayName == "Луч Земли"{
                    if G_Res.eSelectedSlices.count > 0 {
                             for item in 0...G_Res.eSelectedSlices.count-1{
                                 if indexPath.section == G_Res.eSelectedSlices[item]?.section{
                                    
                                     for i in 0...ray.slices.count{
                                         self.collectionView.deselectItem(at: [indexPath.section,i], animated: false)
                                         
                                          
                                     }
                                     G_Res.eSelectedSlices.remove(at: item)
                                     G_Res.eSelectedSlices.append(indexPath)
                                     
                                     self.collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .centeredHorizontally)
                                     
                                 }else{
                                    if allreadyClicked(cur: indexPath.section, rayName: rayName) == false{
                                         for i in 0...ray.slices.count{
                                             self.collectionView.deselectItem(at: [indexPath.section,i], animated: false)

                                         }
                                         G_Res.eSelectedSlices.append(indexPath)
                                         self.collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .centeredHorizontally)
                                     }

                                 }
                                
                             }
                         }else{
                             G_Res.eSelectedSlices.append(indexPath)
                         }
                     
            }
           if rayName == "Луч Человека" {
            
                    if G_Res.hSelectedSlices.count > 0 {
                             for item in 0...G_Res.hSelectedSlices.count-1{
                                 if indexPath.section == G_Res.hSelectedSlices[item]?.section{
                                    
                                     for i in 0...ray.slices.count{
                                         self.collectionView.deselectItem(at: [indexPath.section,i], animated: false)
                                         
                                          
                                     }
                                     G_Res.hSelectedSlices.remove(at: item)
                                     G_Res.hSelectedSlices.append(indexPath)
                                     
                                     self.collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .centeredHorizontally)
                                     
                                 }else{
                                     if allreadyClicked(cur: indexPath.section, rayName: rayName) == false{
                                         for i in 0...ray.slices.count{
                                             self.collectionView.deselectItem(at: [indexPath.section,i], animated: false)

                                         }
                                         G_Res.hSelectedSlices.append(indexPath)
                                         self.collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .centeredHorizontally)
                                     }

                                 }
                                
                             }
                         }else{
                             G_Res.hSelectedSlices.append(indexPath)
                         }
                       
           }
           if rayName == "Луч Возврата" {
                        if G_Res.rSelectedSlices.count > 0 {
                                 for item in 0...G_Res.rSelectedSlices.count-1{
                                     if indexPath.section == G_Res.rSelectedSlices[item]?.section{
                                        
                                         for i in 0...ray.slices.count{
                                             self.collectionView.deselectItem(at: [indexPath.section,i], animated: false)
                                             
                                         }
                                         G_Res.rSelectedSlices.remove(at: item)
                                         G_Res.rSelectedSlices.append(indexPath)
                                         
                                         self.collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .centeredHorizontally)
                                         
                                     }else{
                                         if allreadyClicked(cur: indexPath.section, rayName: rayName) == false{
                                             for i in 0...ray.slices.count{
                                                 self.collectionView.deselectItem(at: [indexPath.section,i], animated: false)

                                             }
                                             G_Res.rSelectedSlices.append(indexPath)
                                             self.collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .centeredHorizontally)
                                         }

                                     }
                                    
                                 }
                             }else{
                                 G_Res.rSelectedSlices.append(indexPath)
                             }
                          
                }
        if rayName == "Луч Выхода" {
                      if G_Res.exSelectedSlices.count > 0 {
                               for item in 0...G_Res.exSelectedSlices.count-1{
                                   if indexPath.section == G_Res.exSelectedSlices[item]?.section{
                                      
                                       for i in 0...ray.slices.count{
                                           self.collectionView.deselectItem(at: [indexPath.section,i], animated: false)
                                           
                                            
                                       }
                                       G_Res.exSelectedSlices.remove(at: item)
                                       G_Res.exSelectedSlices.append(indexPath)
                                       
                                       self.collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .centeredHorizontally)
                                       
                                   }else{
                                       if allreadyClicked(cur: indexPath.section, rayName: rayName) == false{
                                           for i in 0...ray.slices.count{
                                               self.collectionView.deselectItem(at: [indexPath.section,i], animated: false)

                                           }
                                           G_Res.exSelectedSlices.append(indexPath)
                                           self.collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .centeredHorizontally)
                                       }

                                   }
                                  
                               }
                           }else{
                               G_Res.exSelectedSlices.append(indexPath)
                           }
                       
              }
        
//тут нужно будет заюзать решения выбранные ранее. Те что касаются лучей и G_Res
        
     
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
      return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
      return sectionInsets.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: self.frame.width-80, height: 80)
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
       return CGSize(width: self.frame.width, height: 50)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: self.frame.width, height: 150)
    }
    
}
