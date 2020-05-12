//
//  ViewController.swift
//  RayNutrition_1.0
//
//  Created by LA'D on 18.02.2020.
//  Copyright © 2020 Garonum. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    
   
    var collectionView: UICollectionView!
    
    let rayOfEarth = Rays(rayName: "Луч Земли")
    let rayOfHuman = Rays(rayName: "Луч Человека")
    let rayOfReturn = Rays(rayName: "Луч Возврата")
    let rayOfExit = Rays(rayName: "Луч Выхода")
    
    var earthId = "Луч Земли"
    var humanId = "Луч Человека"
    var returnId = "Луч Возврата"
    var exitId = "Луч Выхода"
    var resultsId = "Results"

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.purple
        setupMenuBar()
        setupCollectionView()
        // Do any additional setup after loading the view.
    }
    
    lazy var menuBar: MenuBar = {
                 let mb = MenuBar()
              mb.viewController = self
                    return mb
                }()
       
    let titles = ["Home1", "Home2", "Home3", "Home4",]
    

   func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
       let index = Int(targetContentOffset.pointee.x / view.frame.width)
       let indexPath = IndexPath(item: index, section: 0)
       menuBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
   }
    
    
    func switchToMenuIndex(menuIndex: Int) {
        let indexPath = IndexPath(item: menuIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
        if menuIndex == 4{
         NotificationCenter.default.post(name: NSNotification.Name("results"), object: nil)
           
        }
    }
    
    private func setupMenuBar() {
             
             view.addSubview(menuBar)
             view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
             view.addConstraintsWithFormat("V:[v0(50)]-0-|", views: menuBar)

         }
    
    func setupCollectionView() {
          let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
             collectionView = UICollectionView(frame: CGRect(x: 0, y: 25, width: self.view.frame.width, height: self.view.frame.height-70), collectionViewLayout: layout)
        
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
                    flowLayout.scrollDirection = .horizontal
                    flowLayout.minimumLineSpacing = 0
                }
               
            collectionView.dataSource = self
            collectionView.delegate = self
            //collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
            collectionView.register(UniversalRayController.self, forCellWithReuseIdentifier: earthId)
            collectionView.register(UniversalRayController.self, forCellWithReuseIdentifier: humanId)
            collectionView.register(UniversalRayController.self, forCellWithReuseIdentifier: returnId)
            collectionView.register(UniversalRayController.self, forCellWithReuseIdentifier: exitId)
            collectionView.register(ResultsController.self, forCellWithReuseIdentifier: resultsId)

            collectionView.showsVerticalScrollIndicator = false
            collectionView.backgroundColor = UIColor.white
            collectionView?.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
             //collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
            collectionView?.isScrollEnabled = false
        
            collectionView?.isPagingEnabled = true
        
            self.view.addSubview(collectionView)
      }

}

extension ViewController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           
        
        if indexPath.item == 0 {
           
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: earthId, for: indexPath) as! UniversalRayController
                         
            cell.RayN = "Луч Земли"
            cell.rayData = rayOfEarth
             return cell
        }
        if indexPath.item == 1 {
               
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: humanId, for: indexPath) as! UniversalRayController
               cell.RayN = "Луч Человека"
                cell.rayData = rayOfHuman
                return cell
           }
        if indexPath.item == 2 {
              
                  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: returnId, for: indexPath) as! UniversalRayController
                 cell.RayN = "Луч Возврата"
                  cell.rayData = rayOfReturn
                  return cell
                 }
        if indexPath.item == 3 {
                  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: exitId, for: indexPath) as! UniversalRayController
                 cell.RayN = "Луч Выхода"
                  cell.rayData = rayOfExit
                  return cell
                 }
        if indexPath.item == 4 {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: resultsId, for: indexPath)
        //cell.RayN = "Результаты"
         //cell.rayData = rayOfExit
         return cell
        }
        
//           switch indexPath.item {
////           case 90:
////               identifier = earthId
////               cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! UniversalRayController
////
////           case 10:
////               identifier = humanId
////               cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
////           case 22:
////               identifier = returnId
////               cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
////           case 33:
////               identifier = exitId
////               cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
//           case 44:
//                identifier = resultsId
//                cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
//
//           default:
//               identifier = earthId
//               cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
//           }
                
        let cell:UICollectionViewCell!
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: "", for: indexPath)
        return cell
       }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: view.frame.width, height: view.frame.height-70)
       }
}

