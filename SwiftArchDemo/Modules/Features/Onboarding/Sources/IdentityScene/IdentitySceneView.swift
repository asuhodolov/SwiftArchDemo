//
//  IdentitySceneView.swift
//  Root
//
//  Created by Alexander Suhodolov on 10/04/2025.
//

import Foundation
import UIKit
import AppFoundation

@MainActor
protocol IdentitySceneViewInput: AnyObject {
    func set(
        firstName: String?,
        lastName: String?)
}

@MainActor
protocol IdentitySceneViewOutput: AnyObject {
    func viewDidLoad()
    func userDidPressConfirm()
}

final class IdentitySceneView: UIViewController, ModuleHolderProtocol {
    var retainedModuleElements = [AnyObject]()
    
    weak var presenter: IdentitySceneViewOutput?
    
    private lazy var firstNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkText
        return label
    }()
    
    private lazy var lastNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkText
        return label
    }()
    
    private lazy var confirmButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.darkText, for: .normal)
        button.setTitle(
            String(
                localized: "onboaring_confirmButton_title",
                defaultValue: "Confirm",
                bundle: Bundle.main),
            for: .normal)
        button.addTarget(
            self,
            action: #selector(confirmButtonPressed),
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
            localized: "onboaring_userIdentity_navigationTitle",
            defaultValue: "User Identity",
            bundle: Bundle.main)
        view.backgroundColor = .systemBackground
        
        view.addSubview(firstNameLabel)
        view.addSubview(lastNameLabel)
        view.addSubview(confirmButton)
        
        NSLayoutConstraint.activate([
            firstNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            firstNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            firstNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            lastNameLabel.topAnchor.constraint(equalTo: firstNameLabel.bottomAnchor, constant: 20),
            lastNameLabel.leadingAnchor.constraint(equalTo: firstNameLabel.leadingAnchor),
            lastNameLabel.trailingAnchor.constraint(equalTo: firstNameLabel.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            confirmButton.topAnchor.constraint(equalTo: lastNameLabel.bottomAnchor, constant: 50),
            confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    @objc
    private func confirmButtonPressed() {
        presenter?.userDidPressConfirm()
    }
}

// MARK: - IdentitySceneViewInput

extension IdentitySceneView: IdentitySceneViewInput {
    func set(
        firstName: String?,
        lastName: String?
    ) {
        firstNameLabel.text = String(
            localized: "onboaring_userIdentity_firstName",
            defaultValue: "First Name: ",
            bundle: Bundle.module
        ) + (firstName ?? "")
        
        lastNameLabel.text = String(
            localized: "onboaring_userIdentity_lastName",
            defaultValue: "Last Name: ",
            bundle: Bundle.module
        ) + (lastName ?? "")
    }
}
