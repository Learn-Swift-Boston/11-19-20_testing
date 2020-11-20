//
//  PostsVCTests.swift
//  RedditorTests
//
//  Created by Matthew Dias on 11/19/20.
//

import XCTest
@testable import Redditor

class PostsVCTests: XCTestCase {

    let vc = PostsTableViewController()
    var cell: UITableViewCell!

    override func setUpWithError() throws {
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: "whatever")
    }

    override func tearDownWithError() throws {
        cell = nil // other teardown stuff
    }

    func testEvenColorTableViewCell() {
        vc.color(cell: cell, for: IndexPath(row: 0, section: 0))
        XCTAssertEqual(cell.textLabel?.textColor, .white)
        XCTAssertEqual(cell.detailTextLabel?.textColor, .lightGray)
        XCTAssertEqual(cell.backgroundColor, .darkGray)
    }

    func testOddColorTableViewCell() {
        vc.color(cell: cell, for: IndexPath(row: 1, section: 0))
        XCTAssertEqual(cell.textLabel?.textColor, .label)
        XCTAssertEqual(cell.detailTextLabel?.textColor, .label)
        XCTAssertNil(cell.backgroundColor)
    }

}
