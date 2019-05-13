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
            return CGSize(width: screenBounds.width - 80, height: 44)
        case 351...400:
            return CGSize(width: screenBounds.width - 100, height: 44)
        case 401...420:
            return CGSize(width: screenBounds.width - 140, height: 50)
        case 421...3000:
            return CGSize(width: screenBounds.width - 360, height: 60)
        default:
            return CGSize(width: screenBounds.width - 100, height: 44)
        }
    }
}





public class FormCellSizes: FormCellSizing {
    public var screenBounds: CGRect
    public init(screenBounds: CGRect = UIScreen.main.bounds) {
        self.screenBounds = screenBounds
    }
}
