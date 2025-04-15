//
//  ITunesSearchPresenter.swift
//  SwiftArchDemo
//
//  Created by Alexander Suhodolov on 10/04/2025
//

@preconcurrency import Foundation
import OSLog

@MainActor
final class ITunesSearchPresenter {
    struct Constants {
        static let searchDelay: Double = 0.5
    }
    
    weak var view: ITunesSearchViewInput?
    weak var router: ITunesSearchRouterProtocol?
    
    let albumsProvider: ArtistAlbumsProviderProtocol
    var albums = [ArtistAlbum]()
    var delayedSearchWorkItem: DispatchWorkItem?
    var loadAlbumsTask: Task<Void, Error>?
    
    init(
        view: ITunesSearchViewInput? = nil,
        router: ITunesSearchRouterProtocol? = nil,
        albumsProvider: ArtistAlbumsProviderProtocol
    ) {
        self.view = view
        self.router = router
        self.albumsProvider = albumsProvider
    }
    
    deinit {
        delayedSearchWorkItem?.cancel()
        loadAlbumsTask?.cancel()
    }
    
    private func retrieveAlbums(of artistName: String) {
        loadAlbumsTask?.cancel()
        loadAlbumsTask = Task { [albumsProvider] in
            do {
                let albums = try await albumsProvider.retrieveAlbums(of: artistName)
                try Task.checkCancellation()
                await MainActor.run {
                    processAlbums(albums)
                }
            } catch (let error) {
                Logger.iTunesStoryNamespace.info("Error loading albums: \(error.localizedDescription)")
            }
        }
    }
    
    private func processAlbums(_ albums: [ArtistAlbum]) {
        self.albums = albums
        view?.show(albums: albums)
    }
}


// MARK: - ITunesSearchViewOutput

extension ITunesSearchPresenter: ITunesSearchViewOutput {
    func viewDidLoad() {}
    
    func searchQueryUpdated(artistName: String) {
        delayedSearchWorkItem?.cancel()
        
        let workItem = DispatchWorkItem { [weak self] in
             self?.retrieveAlbums(of: artistName)
        }
        DispatchQueue.main.asyncAfter(
            deadline: .now() + Self.Constants.searchDelay,
            execute: workItem)
        
        self.delayedSearchWorkItem = workItem
    }
}
