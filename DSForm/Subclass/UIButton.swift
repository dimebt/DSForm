//
//  UIButton.swift
//  Love A Frenchie 01
//
//  Created by Dimitar Stefanovski on 2/13/19.
//  Copyright © 2019 Dimitar Stefanovski. All rights reserved.
//

import UIKit

class LinkButton: UIButton {

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
        self.backgroundColor = UIColor.clear
        self.titleLabel?.textAlignment = .center
    }
    

}





class SignInButton: UIButton {
    
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
        self.backgroundColor = UIColor.white.withAlphaComponent(0.25)
        self.titleLabel?.textAlignment = .center
        self.layer.cornerRadius = 5
        self.contentEdgeInsets = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20
        )
    }
        
    
}
