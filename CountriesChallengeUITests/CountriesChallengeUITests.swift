//
//  CountriesChallengeUITests.swift
//  CountriesChallengeUITests
//
//CountriesChallengeUITests/BaseUITest.swift
import XCTest

class CountriesChallengeUITests: BaseUITest {

   

    func testExample() throws {
        // UI tests must launch the application that they test.
        let firstCell = app.tables.cells.element(boundBy: 0)
        // Use XCTAssert and related functions to verify your tests produce the correct results.
            XCTAssertTrue(firstCell.waitForExistence(timeout: 5), "The countries list did not load.")

    }
    
    func testTapOnCountryCell() throws {
        let firstCell = app.tables.cells.element(boundBy: 0)
        XCTAssertTrue(firstCell.waitForExistence(timeout: 5), "First country cell does not exist.")

        firstCell.tap()

        // Example: check if a label with country details appears
        let detailLabel = app.staticTexts["CountryDetail"]
        XCTAssertTrue(detailLabel.waitForExistence(timeout: 5), "Detail view did not appear after tapping the cell.")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                app.launch()
            }
        }
    }
}
