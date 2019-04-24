//
//  FormElementGenerator.swift
//  FormTest
//
//  Created by Dimitar Stefanovski on 4/22/19.
//  Copyright © 2019 Dimitar Stefanovski. All rights reserved.
//

import UIKit


public class FormElementGenerator {
    
    public var elements: [FormElement] = [FormElement]()
    
    public init(elementTypes: [FormElementType]) {
        var elementIterator = 1
        for element in elementTypes {
            switch element {
                
            case .TextField:
                var textField = FormElementTextField(text: "textfield")
                textField.identifier = "element\(elementIterator)"
                textField.topLabel = "element\(elementIterator)"
                elements.append(textField)
                break
            case .Label:
                var label = FormElementLabel(text: "Label")
                label.identifier = "element\(elementIterator)"
                elements.append(label)
                break
            case .Button:
                var button = FormElementButton(title: "Sign In")
                button.identifier = "element\(elementIterator)"
                elements.append(button)
                break
            case .Title:
                var title = FormElementTitle(text: "Title")
                title.font = UIFont.systemFont(ofSize: 24)
                title.identifier = "element\(elementIterator)"
                elements.append(title)
                break
            }
            
            elementIterator += 1
        }
    }
    
    
}
