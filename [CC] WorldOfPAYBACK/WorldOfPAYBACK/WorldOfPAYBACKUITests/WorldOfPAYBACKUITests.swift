//
//  WorldOfPAYBACKUITests.swift
//  WorldOfPAYBACKUITests
//
//  Created by Amel Dizdarevic on 1/22/23.
//

import XCTest

final class WorldOfPAYBACKUITests: XCTestCase {

    override func setUpWithError() throws {

        continueAfterFailure = false
    }

    func test_TransactionsListView_SumButton_shouldShow() throws {
        let app = XCUIApplication()
        app.launch()
        XCUIApplication().buttons["SUM: 5770 PBP"].tap()
    }

    func test_TransactionsListView_FilterButton_shouldDisplay() throws {
        let app = XCUIApplication()
        app.launch()
        let app = XCUIApplication()
        app.navigationBars["Transaktionen"].buttons["Transaktionen"].tap()
        app.buttons["Filter"].tap()
    }
}
