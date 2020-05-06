//
//  ViewController.swift
//  RayOfReturn
//
//  Created by LA'D on 28.02.2020.
//  Copyright © 2020 Garonum. All rights reserved.
//

import UIKit

class ResultsController:BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    let imageNames = ["home", "trending", "subscriptions", "account", "results"]
    
    
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
              
              collectionView.register(ResultsCell.self, forCellWithReuseIdentifier: cellId)
              collectionView.register(ResultsHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
            
               //collectionView.register(TimeFactor.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "Footer")
              
              collectionView.backgroundColor = UIColor.green
            NotificationCenter.default.addObserver(self, selector: #selector(reloadResults(notification:)), name: NSNotification.Name(rawValue: "results"), object: nil)
            
          }
    @objc func reloadResults(notification: NSNotification) {
        collectionView.reloadData()
        
    }
    private let sectionInsets = UIEdgeInsets(top: 20.0,
    left: 20.0,
    bottom: 5.0,
    right: 20.0)
    private let itemsPerRow: CGFloat = 4

}

extension ResultsController {
    
    //1
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
      //2
      let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
      let availableWidth = self.frame.width - paddingSpace
      let widthPerItem = availableWidth / itemsPerRow
      
      return CGSize(width: widthPerItem, height: widthPerItem+50)
    }
    
    //3
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
    //-------------------------
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 4
        }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! ResultsCell
            cell.backgroundColor = UIColor.yellow
           //cell.rayOfReturn = slices[indexPath.item]
            cell.imageView.image = UIImage(named: imageNames[indexPath.item])?.withRenderingMode(.alwaysTemplate)
            cell.row = indexPath.row
            
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
//     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//         return CGSize(width: self.frame.width-80, height: 80)
//     }
     func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            
          if kind == UICollectionView.elementKindSectionHeader {
              let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath)
              header.backgroundColor = .blue
              return header
          }else{
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath)
            header.backgroundColor = .blue
            return header
        }
        
      }
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
// 
//    }
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
           return CGSize(width: self.frame.width, height: 50)
       }
//       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//           return CGSize(width: self.frame.width, height: 100)
//       }
}


