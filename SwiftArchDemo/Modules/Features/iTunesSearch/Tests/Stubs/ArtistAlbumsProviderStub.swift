//
//  ArtistAlbumsProviderStub.swift
//
//  Created by Alexander Suhodolov on 10/04/2025
//

import Foundation
import Models
@testable
import iTunesSearch

class ArtistAlbumsProviderStub: ArtistAlbumsProviderProtocol {
    let stubbedAlbums: [ArtistAlbum]
    
    init(stubbedAlbums: [ArtistAlbum]) {
        self.stubbedAlbums = stubbedAlbums
    }
    
    func retrieveAlbums(of artist: String) async throws -> [ArtistAlbum] {
        return stubbedAlbums
    }
}
