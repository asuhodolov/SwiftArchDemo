//
//  JSONFileRepositoryTests.swift
//  Root
//
//  Created by Alexander Suhodolov on 11/04/2025.
//

import XCTest
import Services
import Models

final class JSONFileRepositoryTests: XCTestCase {
    struct Constants {
        static let fileName: String = "fileName"
        static let userIdentity: UserIdentity = UserIdentity(firstName: "First", lastName: nil)
    }
    
    var fileRepository: JSONFileRepository<UserIdentity>!
    
    override func setUp() {
        fileRepository = JSONFileRepository()
        try? fileRepository.save(
            resource: nil,
            resourceId: Constants.fileName)
    }

    override func tearDown() {
        fileRepository = nil
    }

    func testFileRepositorySaving()  {
        var userIdentity = fileRepository.load(resourceId: Constants.fileName)
        XCTAssertNil(userIdentity, "User Identity must be nil if file not present")
        
        XCTAssertNoThrow(
            try fileRepository.save(
                resource: Constants.userIdentity,
                resourceId: Constants.fileName),
            "JSONFileRepository throws on save")
        
        userIdentity = fileRepository.load(resourceId: Constants.fileName)
        XCTAssertTrue(
            userIdentity?.firstName == Constants.userIdentity.firstName
            && userIdentity?.lastName == Constants.userIdentity.lastName,
            "JSONFileRepository saved wrong data")
    }
}
