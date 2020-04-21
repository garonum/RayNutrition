//
//  VideoCell.swift
//  youtube
//
//  Created by Brian Voong on 6/3/16.
//  Copyright © 2016 letsbuildthatapp. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    var dPId = 0
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func nextDPId(){
        dPId += 1
    }
}

class RayCell: BaseCell {
    
    var rayOfReturn: Slices? {
        didSet {
            
            titleLabel.text = rayOfReturn?.productsName
            platName.text = rayOfReturn?.platName
            directionOfObservation.text = rayOfReturn?.directionOfObservation
            
                       
            
        }
    }
    
    var result = Result()
    var test : [Int: Int] = [:]
    var row: Int = 0
    var section: Int = 0
    var rayName: String = ""
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "-"
        label.numberOfLines = 2
        label.textColor = UIColor.black
        return label
    }()
    let platName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "-"
        label.numberOfLines = 2
        label.textColor = UIColor.black
        return label
    }()
    let directionOfObservation: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "_"
        label.numberOfLines = 2
        label.textColor = UIColor.black
        return label
        
    }()
    
    var titleLabelHeightConstraint: NSLayoutConstraint?
    
    override func setupViews() {
        addSubview(separatorView)
        addSubview(titleLabel)
        addSubview(platName)
        addSubview(directionOfObservation)
    
        addConstraintsWithFormat("H:|[v0]|", views: separatorView)
        addConstraintsWithFormat("H:|-15-[v0]|", views: titleLabel)
        addConstraintsWithFormat("H:|-15-[v0]|", views: platName)
        addConstraintsWithFormat("H:|-15-[v0]|", views: directionOfObservation)

        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))
        addConstraint(NSLayoutConstraint(item: platName, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 70))
        addConstraint(NSLayoutConstraint(item: directionOfObservation, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 120))
        
    }

    override var isSelected: Bool {
      didSet {
        self.backgroundColor = isSelected ? UIColor.white : UIColor.yellow


      }
    }
//    override var isSelected: Bool {
//       didSet {
//         //directionOfObservation.layer.borderWidth = isSelected ? 10 : 0
//        self.backgroundColor = isSelected ? UIColor.white : UIColor.yellow
//        
//        if isSelected {
//    
//           result.saveRayCoefficient(rayName: rayName, rowNumber: row, sectionNumber: section)
//         
//        }else{
//         //   print("I print")
//        }
//        
//       }
//     }
//   func getIndexPathFor(view: UIView, collectionView: UICollectionView) -> NSIndexPath? {
//
//        let point = collectionView.convert(view.bounds.origin, from: view)
//        let indexPath = collectionView.indexPathForItem(at: point)
//        return indexPath as NSIndexPath?
//    }
   
}
