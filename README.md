![DSForm Logo](https://github.com/dimebt/DSForm/blob/master/DSForm.jpg)
[![Build Status](https://travis-ci.org/dimebt/DSForm.svg?branch=master)](https://travis-ci.org/dimebt/DSForm)
[![codecov](https://codecov.io/gh/dimebt/DSForm/branch/master/graph/badge.svg)](https://codecov.io/gh/dimebt/DSForm)
![Cocoapods platforms](https://img.shields.io/cocoapods/p/DSForm.svg?color=green)
![GitHub repo size](https://img.shields.io/github/repo-size/dimebt/DSForm.svg)
[![Gitter](https://badges.gitter.im/DSFormSwift/community.svg)](https://gitter.im/DSFormSwift/community?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)
![GitHub](https://img.shields.io/github/license/dimebt/DSForm.svg)
![Cocoapods](https://img.shields.io/cocoapods/v/DSForm.svg)
![Website](https://img.shields.io/website/http/stefanovski.co.svg?color=blueviolet)

Swift framework for creating dynamic forms.

# DSForm
![DSForm Screencast](https://github.com/dimebt/DSForm/blob/master/images/demo.gif?raw=true)

Simple and easy to implement iOS Swift framework for building forms. It is builded on top of `UICollectionViewController` component. 

Supports 4 basic types of form elements:

1. `FormElementTitle` (top title label of the form)
2. `FormElementButton` (subclass of `UIButton` control)
3. `FormElementTextField` (subclass of `UITextField` control)
4. `FormElementLabel` (subclass of `UILabel` control)


## Requirements
* Xcode 10.2
* Swift 5.0

## Installation
### [CocoaPods](https://guides.cocoapods.org/using/using-cocoapods.html)

```ruby
# Podfile
use_frameworks!

target 'YOUR_TARGET_NAME' do
    pod 'DSForm'
end
```

Replace `YOUR_TARGET_NAME` and then, in the `Podfile` directory, type:

```bash
$ pod install
```

## Example usage

1. Create new `UICollectionVewController` and make it subbclass of `FormCollectionViewController`.
2. Set the `formDelegate` to `self` in `viewDidLoad()` method  so we can use the protocol `FormDelegate` methods in our class.

```swift
import UIKit
import DSForm

class ViewController: FormCollectionViewController, FormDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        
        let element1 = FormElementTitle(text: "Please Sign Up")
        let element2 = FormElementTextField(text: "Username")
        let element3 = FormElementTextField(text: "Password")
        let element4 = FormElementButton(title: "Sign Up")
        fields = [element1, element2, element3, element4]
        
        formDelegate = self
    }
    
    func didSubmitForm(fields: [String : String]) {
        print(fields)
    }
}
```

## Form Elements

DSForm supports 4 basic form elements inside our collection: 

### `FormElementTitle`
It defines the title of the form and it is a subclass of the standard `UILabel` control.
```swift
let element1 = FormElementTitle(text: "Please Sign Up")
```
![FormElementTitle](https://github.com/dimebt/DSForm/blob/master/images/FormElementTitle.png?raw=true)

`FormElementTitle` available public properties:
```swift
    public var font: UIFont
    public var identifier: String
    public var backgroundColor: UIColor
    public var fontColor: UIColor
    public var text: String
```

### `FormElementTextField`
Supports user input and it is a subclass of the standard `UITextField` control.
```swift
var element2 = FormElementTextField(text: "Username")
element2.topLabel = "Username"
```
![FormElementTextField](https://github.com/dimebt/DSForm/blob/master/images/FormElementTextField.png?raw=true)

`FormElementTextField` available public properties:
```swift
    public var font: UIFont
    public var identifier: String
    public var backgroundColor: UIColor
    public var fontColor: UIColor
    public var topLabel: String
    public var placeholder: String
    public var validation: DSForm.FormValidation
    public var text: String
```

### `FormElementButton`
Subclass of the standard `UIButton` control.
```swift
let element4 = FormElementButton(title: "Sign Up")
```
![FormElementButton](https://github.com/dimebt/DSForm/blob/master/images/FormElementButton.png?raw=true)

`FormElementButton` available public properties:
```swift
    public var font: UIFont
    public var identifier: String
    public var backgroundColor: UIColor
    public var fontColor: UIColor
    public var title: String
```

### `FormElementLabel`
Subclass of the standard `UILabel` control.
```swift
let element5 = FormElementLabel(text: "Sample text")
```
![FormElementLabel](https://github.com/dimebt/DSForm/blob/master/images/FormElementLabel.png?raw=true)

`FormElementLabel` available public properties:
```swift
    public var font: UIFont
    public var identifier: String
    public var backgroundColor: UIColor
    public var fontColor: UIColor
    public var text: String
```


## ToDo:
- [ ] Reference the delegate property with @IBOutlet for easy connection from Xcode interface builder
- [ ] Add support for more form elements and variations (image, checkmark, radio button etc...)
- [ ] Add validation to `UITextField` (phone number, email address, numbers, regex, password etc...)
- [ ] Add more styles to form elements
- [ ] Add more Unit Tests
- [ ] Add detailed documentation for every new feature

## Done:
- [ ] Add blank space (element) between form elements
- [x] Added element size property
- [x] Added `CollectionView` `UIEdgeInsets` property
- [x] Added placeholder text to `FormElementTextField`
- [x] Added new `.Line` style to `FormElementTextField`

## Screenshot Simulator
<img src="https://github.com/dimebt/DSForm/blob/master/images/screenshot_simulator.png" width="300">

## Screenshot Xcode
<img src="https://github.com/dimebt/DSForm/blob/master/images/screenshoot_xcode.png" width="300">
