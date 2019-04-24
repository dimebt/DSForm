//
//  TextFieldCollectionViewCell.swift
//  FormTest
//
//  Created by Dimitar Stefanovski on 4/8/19.
//  Copyright © 2019 Dimitar Stefanovski. All rights reserved.
//

import UIKit

class TextFieldCollectionViewCell: UICollectionViewCell {
  
    @IBOutlet weak var textFieldLabel: UILabel!
    @IBOutlet weak var textField: UITextFieldStyleUnderline!
    private var textFieldIdentifier: String?
    open weak var formCellDelegate: FormCellDelegate? 
    
    override func awakeFromNib() {
        textField.delegate = self
    }
    
    public func configure(field: FormElementTextField) {
        self.textFieldLabel.textColor = field.fontColor
        self.textField.textColor = field.fontColor
        self.textFieldLabel.text = field.topLabel
        self.textField.placeholder = field.placeholder
        self.textFieldIdentifier = field.identifier
        self.textField.backgroundColor = field.backgroundColor.withAlphaComponent(0.04)
        self.textField.font = field.font
        self.textFieldLabel.font = field.font
        switch field.validation {
        case .Password:
            self.textField.isSecureTextEntry = true
            break
        default:
            self.textField.isSecureTextEntry = false
        }        
    }
}

extension TextFieldCollectionViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let currentText = textField.text else { return }
        if formCellDelegate != nil {
            formCellDelegate?.didSetTextField(fieldIdentifier: self.textFieldIdentifier ?? "noIdentifier", text: currentText)
        }
        
    }
    
}

