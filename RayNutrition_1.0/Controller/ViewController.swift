//
//  ViewController.swift
//  RayNutrition_1.0
//
//  Created by LA'D on 18.02.2020.
//  Copyright © 2020 Garonum. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView!
    var earthId = "Earth"
    var humanId = "Human"
    var returnId = "Return"
    var exitId = "Exit"
    var resultsId = "Results"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.purple
        setupMenuBar()
        setupCollectionView()
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
             return 5
         }

       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                    var identifier: String
//        if indexPath.item == 1 {
//                           identifier = earthId
//                       } else {
//                           identifier = trandingId
//                       }
        switch indexPath.item {
        case 0:
            identifier = earthId

        case 1:
            identifier = humanId

        case 2:
            identifier = returnId

        case 3:
            identifier = exitId
        case 4:
        identifier = resultsId
        

        default:
            identifier = humanId
        }
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
           return cell
        }
            
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: view.frame.width, height: view.frame.height-120)
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
        
    }
    
    private func setupMenuBar() {
             
             view.addSubview(menuBar)
             view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
             view.addConstraintsWithFormat("V:[v0(70)]-0-|", views: menuBar)

         }
    
        func setupCollectionView() {
              let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
                 collectionView = UICollectionView(frame: CGRect(x: 0, y: 50, width: self.view.frame.width, height: self.view.frame.height-120), collectionViewLayout: layout)
            
            if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
                        flowLayout.scrollDirection = .horizontal
                        flowLayout.minimumLineSpacing = 0
                    }
                   
                 collectionView.dataSource = self
                 collectionView.delegate = self
                 //collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
            collectionView.register(RayOfEarthController.self, forCellWithReuseIdentifier: earthId)
            collectionView.register(RayOfHumanController.self, forCellWithReuseIdentifier: humanId)
            collectionView.register(RayOfReturnController.self, forCellWithReuseIdentifier: returnId)
            collectionView.register(RayOfExitController.self, forCellWithReuseIdentifier: exitId)
            collectionView.register(ResultsController.self, forCellWithReuseIdentifier: resultsId)
    //        if indexPath.item == 1 {
    //             return collectionView.dequeueReusableCell(withReuseIdentifier: trandingId, for: indexPath)
    //         }
    //          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
    //
    //
    //          return cell
                 collectionView.showsVerticalScrollIndicator = false
                 collectionView.backgroundColor = UIColor.white
                 collectionView?.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                 //collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
                collectionView?.isScrollEnabled = false
            
                 collectionView?.isPagingEnabled = true
            
            self.view.addSubview(collectionView)
          }

}

