//
//  TitleCollectionViewCell.swift
//  FormTest
//
//  Created by Dimitar Stefanovski on 4/17/19.
//  Copyright © 2019 Dimitar Stefanovski. All rights reserved.
//

import UIKit

class TitleCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    public func configure(field: FormElementTitle) {
        self.titleLabel.text = field.text
        self.titleLabel.font = field.font
        self.titleLabel.textColor = field.fontColor
    }
    
}
