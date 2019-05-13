//
//  DSFormTests.swift
//  DSFormTests
//
//  Created by Dimitar Stefanovski on 4/22/19.
//  Copyright © 2019 Dimitar Stefanovski. All rights reserved.
//

import XCTest
@testable import DSForm

class DSFormTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFormCellSizesIphone45S() {
        let mock_Iphone45SSize = FormCellSizes(screenBounds: CGRect(x: 0, y: 0, width: 320, height: 0))
        let cellSize = mock_Iphone45SSize.calculate()
        let expectedCellSize = CGSize(width: 320 - 80, height: 44.0)
        XCTAssertEqual(cellSize, expectedCellSize, "iPhone45S cell size")
    }
    
    func testFormCellSizesIphone678X() {
        let mock_Iphone678XSize = FormCellSizes(screenBounds: CGRect(x: 0, y: 0, width: 375, height: 0))
        let cellSize = mock_Iphone678XSize.calculate()
        let expectedCellSize = CGSize(width: 375 - 100, height: 44.0)
        XCTAssertEqual(cellSize, expectedCellSize, "iPhone678X cell size")
    }
    
    func testFormCellSizesIphone78Plus() {
        let mock_Iphone78PlusSize = FormCellSizes(screenBounds: CGRect(x: 0, y: 0, width: 414, height: 0))
        let cellSize = mock_Iphone78PlusSize.calculate()
        let expectedCellSize = CGSize(width: 414 - 140, height: 50.0)
        XCTAssertEqual(cellSize, expectedCellSize, "iPhone78Plus cell size")
    }
    
    func testFormCellSizesiPad9inch() {
        let mock_iPad9inch = FormCellSizes(screenBounds: CGRect(x: 0, y: 0, width: 768, height: 0))
        let cellSize = mock_iPad9inch.calculate()
        let expectedCellSize = CGSize(width: 768 - 360, height: 60)
        XCTAssertEqual(cellSize, expectedCellSize, "iPad9inch cell size")
    }
    
    func testFormCellSizesUnknown() {
        let mock_UnknownScreen = FormCellSizes(screenBounds: CGRect(x: 0, y: 0, width: 100, height: 0))
        let cellSize = mock_UnknownScreen.calculate()
        let expectedCellSize = CGSize(width: 100 - 100, height: 44)
        XCTAssertEqual(cellSize, expectedCellSize, "Unknown Device cell size")
    }
    
    
    
    
    func testFormElement_Title() {
        let element = FormElementTitle(text: "test text")
        XCTAssertEqual(element.text, "test text", "Form Element test")
    }
    
    func testFormElement_Label() {
        let element = FormElementLabel(text: "test text")
        XCTAssertEqual(element.text, "test text", "Form Element test")
    }
    
    func testFormElement_Button() {
        let element = FormElementButton(title: "test text")
        XCTAssertEqual(element.title, "test text", "Form Element test")
    }
    
    func testFormElement_TextField() {
        let element = FormElementTextField(text: "test text")
        XCTAssertEqual(element.text, "test text", "Form Element test")
    }
    
    
    func testElementStyle() {
        var button = FormElementButton(title: "Title")
        button.setStyle(to: .Light)
        XCTAssertEqual(button.backgroundColor, .white, "Element color is white")
        button.setStyle(to: .Dark)
        XCTAssertEqual(button.backgroundColor, .black, "Element color is black")
    }
    
    
    
    func testElementGenerator() {
        let generator = FormElementGenerator(elementTypes: [.Title, .TextField, .TextField, .Button, .Label])
        XCTAssertEqual(generator.elements.count, 5, "Element count is equal")
    }
    
    

}
