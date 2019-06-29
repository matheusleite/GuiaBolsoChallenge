//
//  NetworkTests.swift
//  GuiaBolsoChallengeTests
//
//  Created by Matheus Leite on 28/06/19.
//  Copyright © 2019 Matheus Leite. All rights reserved.
//

import XCTest
@testable import GuiaBolsoChallenge

class NetworkTests: XCTestCase {
    var network = Network()

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testGetCategoriesRequest() {
        var requestData: Any?
        var responseError: Error?

        let promise = expectation(description: "Completion handler invoked")

        self.network.get(endpoint: "/jokes/categories") { (data, error) in
            requestData = data
            responseError = error as? Error
            promise.fulfill()
        }
        wait(for: [promise], timeout: 5)

        // then
        XCTAssertNil(responseError)
        XCTAssertNotNil(requestData)
    }

    func testGetRandomJokeRequest() {
        var requestData: Any?
        var responseError: Error?

        let promise = expectation(description: "Completion handler invoked")

        self.network.get(endpoint: "/jokes/random?category=dev") { (data, error) in
            requestData = data
            responseError = error as? Error
            promise.fulfill()
        }
        wait(for: [promise], timeout: 5)

        // then
        XCTAssertNil(responseError)
        XCTAssertNotNil(requestData)
    }
}
