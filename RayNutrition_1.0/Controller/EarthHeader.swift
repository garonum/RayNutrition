//
//  VideoCell.swift
//  youtube
//
//  Created by Brian Voong on 6/3/16.
//  Copyright © 2016 letsbuildthatapp. All rights reserved.
//

import UIKit


class EarthHeader: BaseCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Луч Земли"
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
