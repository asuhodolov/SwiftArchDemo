//
//  ITunesSearchPresenterMock.swift
//
//  Created by Alexander Suhodolov on 10/04/2025
//

import Combine
import Models
@testable
import iTunesSearch

class ITunesSearchViewMock: ITunesSearchViewInput, ObservableObject {    
    @Published private(set) var showAlbumsIsCalled = false
    
    var albumsToDisplay: [ArtistAlbum] = []
    var showAlbumsCallsCount = 0
    
    func show(albums: [ArtistAlbum]) {
        albumsToDisplay = albums
        showAlbumsCallsCount += 1
        showAlbumsIsCalled = true
    }
}
