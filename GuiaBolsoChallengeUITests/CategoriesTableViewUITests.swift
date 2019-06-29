//
//  CategoriesTableViewUITests.swift
//  GuiaBolsoChallengeUITests
//
//  Created by Matheus Leite on 27/06/19.
//  Copyright © 2019 Matheus Leite. All rights reserved.
//

import XCTest

class CategoriesTableViewUITests: XCTestCase {
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    func testUI() {
        let app = XCUIApplication()

        //verify if activity indicator shows
        XCTAssert(app.activityIndicators.element(boundBy: 0).exists)

        //verify if list appears
        let table = app.tables.element(boundBy: 0)
        XCTAssert(table.exists)

        sleep(5)

        //verify item count
        XCTAssertEqual(table.cells.count, 16)
    }
}
