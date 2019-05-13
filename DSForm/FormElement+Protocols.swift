//
//  FormElement+Protocols.swift
//  FormTest
//
//  Created by Dimitar Stefanovski on 4/18/19.
//  Copyright © 2019 Dimitar Stefanovski. All rights reserved.
//

import UIKit


public protocol FormCellDelegate: class {
    func didSetTextField(fieldIdentifier: String, text: String)
    func didSubmitForm(buttonIdentifier: String)
}

public enum FormElementType {
    case TextField, Label, Button, Title
}

public enum FormValidation {
    case None, Username, Password
}

public enum FormStyle {
    case Dark, Light, Line
}


public protocol FormElement {
    var identifier: String { get set }
    var type: FormElementType { get set }
    var font: UIFont  { get set }
    var backgroundColor: UIColor { get set }
    var fontColor: UIColor { get set }
}

extension FormElement {
    mutating func setStyle(to: FormStyle) {
        switch to {
        case .Light:
            self.backgroundColor = .white
            self.fontColor = .white
        case .Dark:
            self.backgroundColor = .black
            self.fontColor = .black
        case .Line:
            self.backgroundColor = .clear
            self.fontColor = .white
        }
    }
}

public struct FormElementButton: FormElement {
    
    //  Default values
    public var font: UIFont = UIFont.systemFont(ofSize: 16)
    public var identifier: String = "button"
    public var backgroundColor: UIColor = .white
    public var fontColor: UIColor = .white
    
    public var title: String
    public var type: FormElementType = .Button
    
    public init(title: String) {
        self.title = title
        self.identifier = title.replacingOccurrences(of: " ", with: "").lowercased()
    }
}

public struct FormElementTextField: FormElement {
    
    //  Default values
    public var font: UIFont = UIFont.systemFont(ofSize: 16)
    public var identifier: String = "textfield"
    public var backgroundColor: UIColor = .white
    public var fontColor: UIColor = .white
    
    public var type: FormElementType = .TextField
   
    public var topLabel: String = ""
    public var placeholder: String = ""
    public var validation: FormValidation = .None
    public var text: String = ""
    
    public init(text: String) {
        self.text = text
        self.placeholder = " " + text
        self.identifier = text.replacingOccurrences(of: " ", with: "").lowercased()
    }
}

public struct FormElementTitle: FormElement {
    public var font: UIFont = UIFont.systemFont(ofSize: 24)
    public var identifier: String = "title"
    public var backgroundColor: UIColor = .white
    public var fontColor: UIColor = .white
    
    public var type: FormElementType = .Title
    public var text: String
    
    public init(text: String) {
        self.text = text
    }
}

public struct FormElementLabel: FormElement {
    public var font: UIFont = UIFont.systemFont(ofSize: 18)
    public var identifier: String = "label"
    public var backgroundColor: UIColor = .clear
    public var fontColor: UIColor = .white
    
    public var type: FormElementType = .Label
    
    public var text: String
    
    public init(text: String) {
        self.text = text
    }
}
