//
//  ResultsHeader.swift
//  RayNutrition_1.0
//
//  Created by LA'D on 28.02.2020.
//  Copyright © 2020 Garonum. All rights reserved.
//

import UIKit


class ResultsHeader: BaseCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Результаты"
        label.numberOfLines = 2
        label.textColor = UIColor.white
        return label
    }()
    
    var titleLabelHeightConstraint: NSLayoutConstraint?
    
    override func setupViews() {
        addSubview(titleLabel)
        addConstraintsWithFormat("H:|-25-[v0]|", views: titleLabel)
        addConstraintsWithFormat("V:|-5-[v0]|", views: titleLabel)
        
    }
   
}
