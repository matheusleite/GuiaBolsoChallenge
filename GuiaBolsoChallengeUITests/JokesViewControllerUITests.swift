//
//  JokesViewControllerUITests.swift
//  GuiaBolsoChallengeUITests
//
//  Created by Matheus Leite on 27/06/19.
//  Copyright © 2019 Matheus Leite. All rights reserved.
//

import XCTest

class JokesViewControllerUITests: XCTestCase {
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    func testUI() {
        //enter into detail view
        let app = XCUIApplication()

        //delay to wait API Request
        sleep(5)
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Dev"]/*[[".cells.staticTexts[\"Dev\"]",".staticTexts[\"Dev\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

        //verify navbar title
        XCTAssert(app.navigationBars.staticTexts.element(boundBy: 0).label.isEqual("Random joke"))

        sleep(4)

        //verify if imageView exists
        XCTAssert(app.images["iconImage"].exists)

        //verify if label exists
        XCTAssert(app.staticTexts["jokeLabel"].exists)

        //verify if label contain text
        XCTAssertFalse(app.staticTexts.element(boundBy: 2).label.isEmpty)
    }
}
