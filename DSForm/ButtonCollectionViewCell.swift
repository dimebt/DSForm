//
//  ButtonCollectionViewCell.swift
//  FormTest
//
//  Created by Dimitar Stefanovski on 4/8/19.
//  Copyright © 2019 Dimitar Stefanovski. All rights reserved.
//

import UIKit

class ButtonCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var button: SignInButton!
    weak var formCellDelegate: FormCellDelegate?
    private var buttonIdentifier: String?
    
    @IBAction func buttonPressed(_ sender: SignInButton) {
        guard let identifier = self.buttonIdentifier else { return }
        formCellDelegate?.didSubmitForm(buttonIdentifier: identifier)
    }
        
    public func configure(field: FormElementButton) {        
        self.button.setTitle(field.title, for: .normal)
        self.button.setTitleColor(field.fontColor, for: .normal)
        if field.backgroundColor == UIColor.clear {
            self.button.backgroundColor = UIColor.white.withAlphaComponent(0.25)
        } else {
            self.button.backgroundColor = field.backgroundColor
        }
        self.buttonIdentifier = field.identifier
    }
    
   
}
