//
//  MusicSearchRequest.swift
//  SwiftArchDemo
//
//  Created by Alexander Suhodolov on 10/04/2025
//

import Foundation
import Services

enum MusicSearchRequest {
    struct Constants {
        static let apiBaseUrlString = "itunes.apple.com"
    }
    
    case searchAlbums(artist: String)
}
 
extension MusicSearchRequest: RequestProtocol {
    var host: String {
        return Constants.apiBaseUrlString
    }
    
    var path: String {
        switch self {
        case .searchAlbums:
            return "/search"
        }
    }
    
    var headers: [String: String] {
        switch self {
        case .searchAlbums:
            return ["Content-Type": "application/json"]
        }
    }
    
    var urlParameters: [String: String?] {
        switch self {
        case .searchAlbums(let artist):
            return [
                "term": artist,
                "media": "music",
                "entity": "album",
                "attribute": "artistTerm"]
        }
    }
    
    var requestType: RequestType {
        switch self {
        case .searchAlbums:
            return .GET
        }
    }
}

class MusicAlbumsSearchDataParser: DataParserProtocol {
    func parse<T: Decodable>(data: Data) throws -> T {
        return try JSONDecoder().decode(T.self, from: data)
    }
}
