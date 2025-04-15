//
//  ModuleHolderProtocol.swift
//  Root
//
//  Created by Alexander Suhodolov on 14/04/2025.
//

@MainActor
public protocol ModuleHolderProtocol {
    var retainedModuleElements: [AnyObject] { get set }
}
