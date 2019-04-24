//
//  LabelCollectionViewCell.swift
//  FormTest
//
//  Created by Dimitar Stefanovski on 4/8/19.
//  Copyright © 2019 Dimitar Stefanovski. All rights reserved.
//

import UIKit

class LabelCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    public func configure(field: FormElementLabel) {
        self.label.textColor = field.fontColor
        self.label.text = field.text
        self.label.backgroundColor = field.backgroundColor.withAlphaComponent(0.04)
        self.label.font = field.font       
    }
    
}
