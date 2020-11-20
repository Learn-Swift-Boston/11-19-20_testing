//
//  RedditorUITests.swift
//  RedditorUITests
//
//  Created by Matt Dias on 11/10/20.
//

import XCTest

class RedditorUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

//        let tablesQuery = app.tables
//        tablesQuery.cells.firstMatch.tap()
//
//        tablesQuery.firstMatch.swipeUp()


        let upsLabel = app.staticTexts["ups label"]
        let initialUpsLabelValue = upsLabel.label

        let textField = app.textFields.firstMatch
        textField.tap()
        textField.clearAndEnterText(text: "guitarpedals")
        textField.typeText(XCUIKeyboardKey.return.rawValue)

        sleep(2)

        let newUpsLabelValue = upsLabel.label
        XCTAssertNotEqual(initialUpsLabelValue, newUpsLabelValue)
    }
}

// https://stackoverflow.com/a/32894080
extension XCUIElement {
    /**
     Removes any current text in the field before typing in the new value
     - Parameter text: the text to enter into the field
     */
    func clearAndEnterText(text: String) {
        guard let stringValue = self.value as? String else {
            XCTFail("Tried to clear and enter text into a non string value")
            return
        }

        self.tap()

        let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: stringValue.count)

        self.typeText(deleteString)
        self.typeText(text)
    }
}
