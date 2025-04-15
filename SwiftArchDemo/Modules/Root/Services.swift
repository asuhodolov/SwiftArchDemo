//
//  Services.swift
//  NewProjectName
//
//  Created by Alexander Suhodolov on 10/04/2025.
//

import Foundation
import Services
import Models

public final class Services {
    lazy var webApiManager: some WebAPIManagerProtocol = {
        WebAPIManager()
    }()
}
