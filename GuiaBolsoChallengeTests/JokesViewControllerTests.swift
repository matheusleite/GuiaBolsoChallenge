//
//  JokesViewControllerTests.swift
//  GuiaBolsoChallengeTests
//
//  Created by Matheus Leite on 27/06/19.
//  Copyright © 2019 Matheus Leite. All rights reserved.
//

import XCTest
@testable import GuiaBolsoChallenge

class JokesViewControllerTests: XCTestCase {
    var viewController: JokesViewController!
    var window: UIWindow!

    override func setUp() {
        super.setUp()
        window = UIWindow()
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        viewController = storyboard.instantiateViewController(withIdentifier: "JokesVC")
            as? JokesViewController
    }

    override func tearDown() {
        window = nil
        super.tearDown()
    }

    func loadView() {
        window.addSubview(viewController.view)
        RunLoop.current.run(until: Date())
    }

    func testCardLayout() {
        loadView()
        viewController.viewDidLayoutSubviews()

        XCTAssertEqual(viewController.cardView.layer.shadowColor, UIColor.black.cgColor)
        XCTAssertEqual(viewController.cardView.layer.shadowOpacity, 0.3)
        XCTAssertEqual(viewController.cardView.layer.shadowOffset, .zero)
        XCTAssertEqual(viewController.cardView.layer.shadowRadius, 5)
        XCTAssertEqual(viewController.cardView.layer.cornerRadius, 10)
    }

    func testComponents () {
        loadView()

        XCTAssertNotNil(viewController.cardView)
        XCTAssertNotNil(viewController.textLabel)
        XCTAssertNotNil(viewController.iconImageView)
    }

    func testContent () {
        loadView()

        //create fake joke data
        let data = "{ \"icon_url\": \"https://assets.chucknorris.host/img/avatar/chuck-norris.png\",\"value\": \"Time waits for no man. Unless that man is Chuck Norris.\" }".data(using: .utf8)!

        self.viewController.jokesViewModel?.joke = try? JSONDecoder().decode(Joke.self, from: data)

        viewController.setUI()

        XCTAssertFalse(viewController.textLabel.text!.isEmpty)
    }
}
