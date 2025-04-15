//
//  File.swift
//  Root
//
//  Created by Alexander Suhodolov on 10/04/2025.
//

import Foundation

final class FirstNameViewPresenter {
    private let view: FirstNameViewInput
    private var firstName: String?
    private let onComplete: (_ firstName: String?) -> Void
    
    init(
        view: FirstNameViewInput,
        firstName: String?,
        onComplete: @escaping (_ firstName: String?) -> Void
    ) {
        self.view = view
        self.firstName = firstName
        self.onComplete = onComplete
    }
    
    private func prepareView() {
        view.setName(firstName)
    }
}

extension FirstNameViewPresenter: FirstNameViewOutput {
    func userDidUpdateName(_ name: String?) {
        self.firstName = name
    }
    
    func userDidConfirmInput() {
        
    }
    
    func viewDidLoad() {
        prepareView()
    }
}
