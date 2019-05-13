//
//  FormCollectionViewController.swift
//  FormTest
//
//  Created by Dimitar Stefanovski on 4/6/19.
//  Copyright © 2019 Dimitar Stefanovski. All rights reserved.
//

import UIKit


@objc public protocol FormDelegate: class {
    func didSubmitForm(fields: [String: String])
}


open class FormCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    public weak var formDelegate: FormDelegate?
    
    public var fields: [FormElement] = [FormElement]()
    public var style: FormStyle = .Light {
        didSet {
            var newFields = [FormElement]()
            for var element in fields {
                element.setStyle(to: style)
                newFields.append(element)
            }
            fields.removeAll()
            fields = newFields
            collectionView.reloadData()
        }
    }
    public var collectionViewEdgeInsets: UIEdgeInsets?
    public var elementSize: CGSize?
    
    //  Private properties
    private var fieldsValues = [String:String]()
    

    override open func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.delaysContentTouches = false
        if let collectionViewEdgeInsets = collectionViewEdgeInsets {
            collectionView.contentInset = collectionViewEdgeInsets
        }
        
        registerNibs()
    }
    
    
    
    private func registerNibs() {
        let textFieldCell = UINib(nibName: "TextFieldCollectionViewCell", bundle: Bundle.init(for: FormCollectionViewController.self))
        self.collectionView!.register(textFieldCell, forCellWithReuseIdentifier: reuseIdentifiers.reuseIdentifierTextField)
        
        let labelCell = UINib(nibName: "LabelCollectionViewCell", bundle: Bundle.init(for: FormCollectionViewController.self))
        self.collectionView!.register(labelCell, forCellWithReuseIdentifier: reuseIdentifiers.reuseIdentifierLabel)
        
        let buttonCell = UINib(nibName: "ButtonCollectionViewCell", bundle: Bundle.init(for: FormCollectionViewController.self))
        self.collectionView!.register(buttonCell, forCellWithReuseIdentifier: reuseIdentifiers.reuseIdentifierButton)
        
        let titleCell = UINib(nibName: "TitleCollectionViewCell", bundle: Bundle.init(for: FormCollectionViewController.self))
        self.collectionView!.register(titleCell, forCellWithReuseIdentifier: reuseIdentifiers.reuseIdentifierTitle)
    }
    
   
    
    override open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected item at index: \(indexPath.row)")
        switch self.fields[indexPath.row].type {
        case .TextField:
//            guard let cell = collectionView.cellForItem(at: indexPath) as? TextFieldCollectionViewCell else { return }
//            cell.contentView.isUserInteractionEnabled = false
            break
        case .Label:
            break
        case .Button:
//            print("button cell click")
//            guard let cell = collectionView.cellForItem(at: indexPath) as? ButtonCollectionViewCell else { return }
//            cell.contentView.isUserInteractionEnabled = false
            break
        case .Title:
            break
        }
    }
   
    
    //  MARK: - Set cell sizes
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let elementSize = self.elementSize else {
            return FormCellSizes().calculate()
        }
        return elementSize
    }
    
    
   
    
}


extension FormCollectionViewController {
    
    override open func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fields.count
    }
    
    open override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch fields[indexPath.row].type {
        case .TextField:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifiers.reuseIdentifierTextField, for: indexPath) as! TextFieldCollectionViewCell
            cell.formCellDelegate = self
            cell.configure(field: fields[indexPath.row] as! FormElementTextField)
            cell.contentView.isUserInteractionEnabled = false
            return cell
        case .Label:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifiers.reuseIdentifierLabel, for: indexPath) as! LabelCollectionViewCell
            cell.configure(field: fields[indexPath.row] as! FormElementLabel)
            return cell
        case .Button:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifiers.reuseIdentifierButton, for: indexPath) as! ButtonCollectionViewCell
            cell.formCellDelegate = self
            cell.configure(field: fields[indexPath.row] as! FormElementButton)
            cell.contentView.isUserInteractionEnabled = false
            return cell
        case .Title:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifiers.reuseIdentifierTitle, for: indexPath) as! TitleCollectionViewCell
            cell.configure(field: fields[indexPath.row] as! FormElementTitle)
            return cell
        }
        // Configure the cell
    }
}




extension FormCollectionViewController: FormCellDelegate {
    
    public func didSubmitForm(buttonIdentifier: String) {
        self.view.endEditing(true)
        
        if self.formDelegate != nil {
            self.formDelegate?.didSubmitForm(fields: self.fieldsValues)
        }
    }
    
    public func didSetTextField(fieldIdentifier: String, text: String) {
        self.fieldsValues[fieldIdentifier] = text
    }
}

