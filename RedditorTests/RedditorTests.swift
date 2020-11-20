//
//  RedditorTests.swift
//  RedditorTests
//
//  Created by Matt Dias on 11/10/20.
//

import XCTest
@testable import Redditor

class RedditorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testSum() {
        /*
         given two inputs, an output is received that is input1 + input2
         */

        /* Gherkin test
         given: some input
         when: I do some operation
         then: some expected result happens
         */
        let expectedOuput = 11

        let actualOutput = sum(10, 1)

        XCTAssertEqual(expectedOuput, actualOutput)
    }
}

func sum(_ in1: Int, _ in2: Int) -> Int {
    return in1 + in2
}
