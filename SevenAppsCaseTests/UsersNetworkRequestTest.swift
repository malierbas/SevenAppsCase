//
//  UsersNetworkRequestTest.swift
//  SevenAppsCaseTests
//
//  Created by Mehmet Ali Erbaş on 1/31/25.
//

import XCTest
@testable import SevenAppsCase

final class UsersNetworkRequestTest: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testUsersRequest() throws {
        Task {
            let expectation = expectation(description: "Fetch users")
            let result: [User]? = try await Networking.shared.request(Endpoints.users)
            if (result ?? []).isEmpty {
                print("result is empty")
                return
            }
            
            XCTAssertNotNil(result)
            expectation.fulfill()
        }
    }
}
