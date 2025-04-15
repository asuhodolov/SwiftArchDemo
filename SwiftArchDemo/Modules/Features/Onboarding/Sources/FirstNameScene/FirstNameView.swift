//
//  FirstNameViewInput.swift
//  Root
//
//  Created by Alexander Suhodolov on 10/04/2025.
//

import Foundation
import UIKit
import AppFoundation

@MainActor
protocol FirstNameViewInput: AnyObject {
    func setName(_ name: String?)
}

@MainActor
protocol FirstNameViewOutput: AnyObject {
    func viewDidLoad()
    func userDidUpdateName(_ name: String?)
    func userDidConfirmInput()
}

final class FirstNameView: UIViewController, ModuleHolderProtocol {
    var retainedModuleElements = [AnyObject]()
    
    weak var presenter: FirstNameViewOutput?
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = String(
            localized: "onboaring_firstName_placeholder",
            defaultValue: "Input First Name",
            bundle: Bundle.module)
        textField.addTarget(
            self,
            action: #selector(textFieldDidChange(_:)),
            for: .editingChanged)
        return textField
    }()
    
    private lazy var submitButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.darkText, for: .normal)
        button.setTitle(
            String(
                localized: "onboaring_submitButton_title",
                defaultValue: "Submit",
                bundle: Bundle.main),
            for: .normal)
        button.addTarget(
            self,
            action: #selector(subbmitButtonPressed),
            for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        presenter?.viewDidLoad()
    }
    
    private func prepareView() {
        title = String(
            localized: "onboaring_firstName_navigationTitle",
            defaultValue: "First Name",
            bundle: Bundle.main)
        view.backgroundColor = .systemBackground
        
        view.addSubview(textField)
        view.addSubview(submitButton)
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
          
        NSLayoutConstraint.activate([
            submitButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 50),
            submitButton.centerXAnchor.constraint(equalTo: textField.centerXAnchor),
            submitButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
// MARK: User Actions
    
    @objc
    private func textFieldDidChange(_ textField: UITextField) {
        presenter?.userDidUpdateName(textField.text)
    }
    
    @objc
    private func subbmitButtonPressed() {
        presenter?.userDidConfirmInput()
    }
}

// MARK: - FirstNameViewInput

extension FirstNameView: FirstNameViewInput {
    func setName(_ name: String?) {
        textField.text = name
    }
}
