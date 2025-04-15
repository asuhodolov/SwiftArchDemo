//
//  FirstNameViewPresenterTests.swift
//  Root
//
//  Created by Alexander Suhodolov on 11/04/2025.
//

import XCTest
@testable
import Onboarding

final class FirstNameViewPresenterTests: XCTestCase {
    private struct Constants {
        static let firstName1: String = "Name1"
        static let firstName2: String = "Name2"
    }
    
    var presenter: FirstNameViewPresenter!
    var view: FirstNameViewMock!
    var presenterCompletionOutput: String?

    override func setUp() {
        super.setUp()
        
        view = FirstNameViewMock()
        presenter = FirstNameViewPresenter(
            view: view,
            firstName: Constants.firstName1,
            onComplete: { [weak self] firstName in
                self?.presenterCompletionOutput = firstName
            })
    }

    override func tearDown() {
        super.tearDown()
    }

    func testViewIsConfigured() {
        presenter.viewDidLoad()
        XCTAssertTrue(
            view.setNameCalled,
            "FirstNameViewPresenter did fail to set up view on viewDidLoad")
    }
    
    func testPresenterCompletionOnSubmit() {
        presenter.userDidUpdateName(Constants.firstName2)
        presenter.userDidConfirmInput()
        XCTAssertEqual(
            Constants.firstName2, presenterCompletionOutput,
            "Presenter completed with wrong result")
    }
}
