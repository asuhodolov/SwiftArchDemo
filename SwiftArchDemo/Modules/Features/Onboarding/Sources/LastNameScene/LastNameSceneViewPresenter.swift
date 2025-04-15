//
//  LastNameSceneViewPresenter.swift
//  Root
//
//  Created by Alexander Suhodolov on 10/04/2025.
//

import Foundation

@MainActor
final class LastNameSceneViewPresenter {
    private weak var view: LastNameSceneViewInput?
    private var lastName: String?
    private let onComplete: (_ lastName: String?) -> Void
    
    init(
        view: LastNameSceneViewInput,
        lastName: String?,
        onComplete: @escaping (_ lastName: String?) -> Void
    ) {
        self.view = view
        self.lastName = lastName
        self.onComplete = onComplete
    }
    
    private func prepareView() {
        view?.setName(lastName)
    }
}

extension LastNameSceneViewPresenter: LastNameSceneViewOutput {
    func userDidUpdateName(_ name: String?) {
        self.lastName = name
    }
    
    func userDidConfirmInput() {
        onComplete(lastName)
    }
    
    func viewDidLoad() {
        prepareView()
    }
}
