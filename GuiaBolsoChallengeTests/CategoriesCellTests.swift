//
//  CategoriesCellTests.swift
//  GuiaBolsoChallengeTests
//
//  Created by Matheus Leite on 29/06/19.
//  Copyright © 2019 Matheus Leite. All rights reserved.
//

import XCTest
@testable import GuiaBolsoChallenge

class CategoriesCellTests: XCTestCase {

    let fakeCategory = "dev"
    var cell : CategoriesTableViewCellViewModel?
    
    override func setUp() {
        cell = CategoriesTableViewCellViewModel(fakeCategory)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSetupCell() {
        XCTAssertEqual(cell!.categoryName, fakeCategory)
    }
    
    func testSetupText() {
        XCTAssertEqual(cell!.textLabel(), fakeCategory.capitalized)
    }

}
