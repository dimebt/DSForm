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
        self.titleLabel?.textAlignment = .center
        self.layer.cornerRadius = 5
        self.contentEdgeInsets = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20
        )
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let backroundColor = self.backgroundColor {
            self.backgroundColor = backroundColor.withAlphaComponent(0.35)
        }
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let backroundColor = self.backgroundColor {
            self.backgroundColor = backroundColor.withAlphaComponent(0.25)
        }
        super.touchesEnded(touches, with: event)
    }
    
}
