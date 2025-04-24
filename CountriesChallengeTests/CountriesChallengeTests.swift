//
//  CountriesChallengeTests.swift
//  CountriesChallengeTests
//

import XCTest

@testable import CountriesChallenge

class CountriesChallengeTests: XCTestCase {

    var viewModel: CountriesViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        try super.setUpWithError()
        viewModel = CountriesViewModel()
        
    }
    


    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        let viewModel = CountriesViewModel()
            let expectation = XCTestExpectation(description: "Countries loaded")

            var loadedCountries: [Country] = []

            let cancellable = viewModel.countriesSubject
                .dropFirst()
                .sink { countries in
                    loadedCountries = countries
                    expectation.fulfill()
                }

            viewModel.refreshCountries()
            wait(for: [expectation], timeout: 2.0)

            XCTAssertFalse(loadedCountries.isEmpty, "Countries list should not be empty")
            cancellable.cancel()
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        
        let countries = (1...1000).map { index in
                Country(
                    capital: "Capital \(index)",
                    code: "C\(index)",
                    currency: Currency(code: "CUR", name: "Currency", symbol: "$"),
                    flag: "🏳️",
                    language: Language(code: "en", name: "English"),
                    name: "Country \(index)",
                    region: "Region \(index)"
                )
            }

            let searchText = "10"
        
        self.measure {
            // Put the code you want to measure the time of here.
            
            let filtered = countries.filter {
                        $0.name.contains(searchText) || $0.capital.contains(searchText)
                    }
                    XCTAssertEqual(filtered.count, 1)
        }
    }

}
