//
//  Logger+Extensions.swift
//  Root
//
//  Created by Alexander Suhodolov on 14/04/2025.
//

import Foundation
import OSLog
import Services

extension Logger {    
    static let iTunesStoryNamespace = Logger(
        subsystem: subsystem,
        category: "iTunesStoryNamespace"
    )
}
