//
//  UITextField.swift
//  Love A Frenchie 01
//
//  Created by Dimitar Stefanovski on 2/12/19.
//  Copyright © 2019 Dimitar Stefanovski. All rights reserved.
//

import UIKit

class UITextFieldStyleUnderline: UITextField {
    
    let bottomLine: UIView = UIView()
    var placeholderAlpha: CGFloat = 0.45
    var placeholderColor: UIColor = UIColor.white
    var bottomLineMultiplier: CGFloat = 0.06
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commoninit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commoninit()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commoninit()
    }
    
    
    private func commoninit() {        
        self.addSubview(self.bottomLine)
        self.borderStyle = .none
    }    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.bottomLine.frame = CGRect(x: 0, y: self.bounds.height + self.frame.height * bottomLineMultiplier, width: self.frame.width, height: self.frame.height * -bottomLineMultiplier)
        self.bottomLine.backgroundColor = placeholderColor.withAlphaComponent(placeholderAlpha)
        
        if let placeholder = placeholder {
            self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: placeholderColor.withAlphaComponent(placeholderAlpha)])
        }
    }
    
    
    
    
    
}


