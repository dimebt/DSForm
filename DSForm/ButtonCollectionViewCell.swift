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
        self.buttonIdentifier = field.identifier
    }
    
   
}
