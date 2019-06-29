//
//  CategoriesTableViewTests.swift
//  GuiaBolsoChallengeTests
//
//  Created by Matheus Leite on 27/06/19.
//  Copyright © 2019 Matheus Leite. All rights reserved.
//

import XCTest
@testable import GuiaBolsoChallenge

class CategoriesTableViewTests: XCTestCase {

    var viewController: CategoriesTableViewController!
    var window: UIWindow!
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        viewController = storyboard.instantiateViewController(withIdentifier: "CategoriesTVC")
            as? CategoriesTableViewController
    }
    
    override func tearDown() {
        window = nil
        super.tearDown()
    }
    
    func loadView() {
        window.addSubview(viewController.view)
        RunLoop.current.run(until: Date())
    }
    
    func testUI () {
        XCTAssertNotNil(viewController.tableView)
    }
    
}
