//
//  File.swift
//  Root
//
//  Created by Alexander Suhodolov on 10/04/2025.
//

import Foundation

public protocol ResourceStorable {
    associatedtype Resource
    
    func save(resource: Resource?, resourceId: String) throws
    func load(resourceId: String) -> Resource?
}
