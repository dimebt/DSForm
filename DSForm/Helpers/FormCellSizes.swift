//
//  FormCellSizes.swift
//  FormTest
//
//  Created by Dimitar Stefanovski on 4/22/19.
//  Copyright © 2019 Dimitar Stefanovski. All rights reserved.
//

import UIKit

@objc public protocol FormCellSizing {
    var screenBounds: CGRect { get set }
}

extension FormCellSizing {
    public func calculate() -> CGSize {
        switch screenBounds.width {
        case 300...350:
            return CGSize(width: screenBounds.width - 10, height: 60)
        case 351...400:
            return CGSize(width: screenBounds.width - 10, height: 75)
        case 401...420:
            return CGSize(width: screenBounds.width - 10, height: 80)
        case 421...3000:
            return CGSize(width: screenBounds.width - 10, height: 85) 
        default:
            return CGSize(width: screenBounds.width - 10, height: 65)
        }
    }
}





public class FormCellSizes: FormCellSizing {
    public var screenBounds: CGRect
    public init(screenBounds: CGRect = UIScreen.main.bounds) {
        self.screenBounds = screenBounds
    }
}
