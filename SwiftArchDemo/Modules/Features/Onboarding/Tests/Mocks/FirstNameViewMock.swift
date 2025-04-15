//
//  FirstNameViewMock.swift
//  Root
//
//  Created by Alexander Suhodolov on 11/04/2025.
//

import Foundation
import XCTest
@testable
import Onboarding

class FirstNameViewMock: FirstNameViewInput {
    var presenter: FirstNameViewOutput?
    var setNameCalled = false
    
    func setName(_ name: String?) {
        setNameCalled = true
    }
}
