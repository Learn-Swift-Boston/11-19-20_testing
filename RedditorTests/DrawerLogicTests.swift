//
//  DrawerLogicTests.swift
//  RedditorTests
//
//  Created by Matthew Dias on 11/19/20.
//

import XCTest
@testable import Redditor

class DrawerLogicTests: XCTestCase {

    func testCalculateState() {
        let drawerVC = DrawerViewController()
        let expectedOutput = (upSum: 10, downSum: 5)
        let actualOutput = drawerVC.calculateStats(posts: [
            Post(title: "some title", downs: 1, ups: 5),
            Post(title: "some title", downs: 2, ups: 2),
            Post(title: "some title", downs: 2, ups: 3),
        ])

        XCTAssertEqual(expectedOutput.upSum, actualOutput.upSum, "upSum")
        XCTAssertEqual(expectedOutput.downSum, actualOutput.downSum, "downSum")
    }

}
