//
//  MusicSearchResponseData.swift
//  SwiftArchDemo
//
//  Created by Alexander Suhodolov on 10/04/2025
//

import Foundation

struct MusicInfoResponseData: Decodable {
    let albumsData: [AlbumData]
    
    enum CodingKeys: String, CodingKey {
        case albumsData = "results"
    }
}

struct AlbumData: Decodable {
    let collectionId: Int
    let collectionName: String
    let artistId: Int
    let artistName: String
}
