//
//  UserIdentity.swift
//  Root
//
//  Created by Alexander Suhodolov on 10/04/2025.
//

import Foundation

public class UserIdentity: Codable {
    public var firstName: String?
    public var lastName: String?
    
    public init(
        firstName: String? = nil,
        lastName: String? = nil
    ) {
        self.firstName = firstName
        self.lastName = lastName
    }
}
