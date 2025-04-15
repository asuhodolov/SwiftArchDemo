//
//  File.swift
//  Root
//
//  Created by Alexander Suhodolov on 10/04/2025.
//

import Foundation
import UIKit

protocol FirstNameViewInput {
    func setName(_ name: String?)
}

protocol FirstNameViewOutput {
    func viewDidLoad()
    func userDidUpdateName(_ name: String?)
    func userDidConfirmInput()
}

final class FirstNameView: UIViewController {
    var presenter: FirstNameViewOutput!
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
//        textField.delegate = self
        textField.placeholder = "First Name"
//        NSLocalizedString(
//            "onboaring_firstName_placeholder",
//            bundle: Bundle.,
//            value: "First Name",
//            comment: "")
        textField.addTarget(
            self,
            action: #selector(textFieldDidChange(_:)),
            for: .editingChanged)
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        presenter.viewDidLoad()
    }
    
    private func prepareView() {
        
    }
    
// MARK: User Actions
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        presenter.userDidUpdateName(textField.text)
    }
}

// MARK: - FirstNameViewInput

extension FirstNameView: FirstNameViewInput {
    func setName(_ name: String?) {
        
    }
}
