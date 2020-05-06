//
//  ResultsCell.swift
//  RayNutrition_1.0
//
//  Created by LA'D on 28.02.2020.
//  Copyright © 2020 Garonum. All rights reserved.
//

import UIKit

class ResultsCell: BaseCell {
    
    var row:Int? {
        didSet {
            let result = Result()
            
            titleLabel.text = "\(result.finalResult(row: row ?? 0))"
            
        }
    }
    
    var rayOfReturn: Slices? {
        didSet {
            titleLabel.text = rayOfReturn?.productsName
            platName.text = rayOfReturn?.platName
            directionOfObservation.text = rayOfReturn?.directionOfObservation

            
        }
    }
    let imageView: UIImageView = {
          let iv = UIImageView()
          iv.image = UIImage(named: "home")?.withRenderingMode(.alwaysTemplate)
          iv.tintColor = UIColor.black
          return iv
      }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.numberOfLines = 2
        label.textColor = UIColor.black
        return label
    }()
    let platName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.numberOfLines = 2
        label.textColor = UIColor.black
        return label
    }()
    let directionOfObservation: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.numberOfLines = 2
        label.textColor = UIColor.black
        return label
        
    }()
    
    var titleLabelHeightConstraint: NSLayoutConstraint?
    
    override func setupViews() {
        addSubview(separatorView)
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(platName)
        addSubview(directionOfObservation)

        
        addConstraintsWithFormat("H:|[v0]|", views: separatorView)
        addConstraintsWithFormat("H:|-[v0(28)]-|", views: imageView)
        addConstraintsWithFormat("V:[v0(28)]", views: imageView)
         addConstraintsWithFormat("V:|-50-[v0]|", views: titleLabel)
        addConstraintsWithFormat("H:|-15-[v0]|", views: titleLabel)
        addConstraintsWithFormat("H:|-15-[v0]|", views: platName)
        addConstraintsWithFormat("H:|-15-[v0]|", views: directionOfObservation)
        
        
//        
//        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
//        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
//        
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))
        addConstraint(NSLayoutConstraint(item: platName, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 70))
        addConstraint(NSLayoutConstraint(item: directionOfObservation, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 120))
        
        
    }
 
   
}
