//
//  ArtistAlbumsProvider.swift
//  SwiftArchDemo
//
//  Created by Alexander Suhodolov on 10/04/2025
//

import Foundation
import Services

protocol ArtistAlbumsProviderProtocol {
    func retrieveAlbums(of artist: String) async throws -> [ArtistAlbum]
}

final class ArtistAlbumsProvider: ArtistAlbumsProviderProtocol {
    let webApiManager: WebAPIManagerProtocol
    
    init(webApiManager: WebAPIManagerProtocol) {
        self.webApiManager = webApiManager
    }
    
    public func retrieveAlbums(of artist: String) async throws -> [ArtistAlbum] {
        let musicData: MusicInfoResponseData = try await webApiManager.perform(
            MusicSearchRequest.searchAlbums(artist: artist),
            parser: MusicAlbumsSearchDataParser())
        
        return musicData.albumsData.map {
            ArtistAlbum(
                albumName: $0.collectionName,
                artistName: $0.artistName)
        }
    }
}
