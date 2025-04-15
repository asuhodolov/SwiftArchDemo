//
//  ITunesSearchPresenterTests.swift
//
//  Created by Alexander Suhodolov on 10/04/2025
//

import XCTest
import Combine
import Models
@testable
import iTunesSearch

class ITunesSearchPresenterTests: XCTestCase {
    static let albums: [ArtistAlbum] = [
        .init(albumName: "Album1", artistName: "Artist1"),
        .init(albumName: "Album2", artistName: "Artist2")
    ]
    var iTunesSearchPresenter: ITunesSearchPresenter!
    var cancellable = Set<AnyCancellable>()
    
    override func setUp() {
        super.setUp()
        let albumsProvider = ArtistAlbumsProviderStub(stubbedAlbums: Self.albums)
        iTunesSearchPresenter = ITunesSearchPresenter(albumsProvider: albumsProvider)
    }
    
    override func tearDown() {
        iTunesSearchPresenter = nil
        super.tearDown()
    }
    
    func testSearchPerformed() {
        let view = ITunesSearchViewMock()
        
        let showAlbumsCallExpectation = XCTestExpectation()
        view.$showAlbumsIsCalled
            .sink { called in
                if called {
                    showAlbumsCallExpectation.fulfill()
                }
            }.store(in: &cancellable)
        
        iTunesSearchPresenter.view = view
        iTunesSearchPresenter.searchQueryUpdated(artistName: "Artist")
        
        wait(
            for: [showAlbumsCallExpectation],
            timeout: ITunesSearchPresenter.Constants.searchDelay + 0.1)
        
        XCTAssert(
            view.albumsToDisplay.count > 0,
            "iTunesSearchInteractor does not display Artists")
    }
}
