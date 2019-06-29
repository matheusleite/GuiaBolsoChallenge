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
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
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
