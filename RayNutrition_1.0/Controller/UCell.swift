//
//  UCell.swift
//  RayNutrition_1.0
//
//  Created by LA'D on 07.05.2020.
//  Copyright © 2020 Garonum. All rights reserved.
//
import UIKit
class BaseCell: UICollectionViewCell {




    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()

    }

    func setupViews() {

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
class UCell: BaseCell {
    
    var slice: Slices? {
        didSet {
            
            titleLabel.text = slice?.productsName
            platName.text = slice?.platName
            directionOfObservation.text = slice?.directionOfObservation
            
                       
            
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

   
}
