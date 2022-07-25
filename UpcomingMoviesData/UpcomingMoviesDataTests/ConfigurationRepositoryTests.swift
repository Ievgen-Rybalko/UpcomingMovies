//
//  ConfigurationRepositoryTests.swift
//  UpcomingMoviesData-Unit-UpcomingMoviesDataTests
//
//  Created by Alonso on 25/06/22.
//

import XCTest
@testable import UpcomingMoviesData
@testable import UpcomingMoviesDomain

class ConfigurationRepositoryTests: XCTestCase {

    private var repository: ConfigurationRepository!
    private var configurationRemoteDataSource: ConfigRemoteDataSourceProtocolMock!

    override func setUpWithError() throws {
        try super.setUpWithError()
        configurationRemoteDataSource = ConfigRemoteDataSourceProtocolMock()
        repository = ConfigurationRepository(remoteDataSource: configurationRemoteDataSource)
    }

    override func tearDownWithError() throws {
        repository = nil
        configurationRemoteDataSource = nil
        try super.tearDownWithError()
    }

    func testGetConfiguration() {
        // Arrange
        let configToTest = Configuration(imagesConfiguration: .init(baseURLString: "testBaseURLString", backdropSizes: [""], posterSizes: [""]),
                                                sortConfiguration: SortConfiguration(movieSortKeys: [""]))
        let expectation = XCTestExpectation(description: "Should get app configuration")
        // Act
        configurationRemoteDataSource.getConfigurationResult = Result.success(configToTest)
        repository.getConfiguration { result in
            guard let configuration = try? result.get() else {
                XCTFail("Error while getting app configuration")
                return
            }
            XCTAssertEqual(configuration.imagesConfiguration.baseURLString, configToTest.imagesConfiguration.baseURLString)
            expectation.fulfill()
        }
        // Assert
        wait(for: [expectation], timeout: 1.0)
        XCTAssertEqual(configurationRemoteDataSource.getConfigurationCallCount, 1)
    }

}
