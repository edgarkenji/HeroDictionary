//
//  CharacterData.swift
//  HeroDictionary
//
//  Created by Edgar Kenji Yamamoto on 06/12/20.
//

import Foundation

public enum ImageType: String, Decodable {
    case portrait, standard, landscape
}

public enum ImageSize: String, Decodable {
    case small, medium, large, amazing, xlarge, fantastic, incredible, uncanny
}

public struct ImageUrl: Decodable {
    let path: String
    let `extension`: String
}

public struct CharacterDataWrapper: Decodable {
    let code: Int?
    let status: String?
    let copyright: String?
    let attributionText: String?
    let etag: String?
    public let data: CharacterDataContainer?
}

public struct CharacterDataContainer: Decodable {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    public let results: [Character]
}

public struct Character: Decodable {
    public let id: Int
    public let name: String?
    public let description: String?
    public let modified: Date?
    public let thumbnail: ImageUrl?
    
    public init(id: Int, name: String?, description: String?, modified: Date?, thumbnail: ImageUrl?) {
        self.id = id
        self.name = name
        self.description = description
        self.modified = modified
        self.thumbnail = thumbnail
    }
}

extension Character : Identifiable {}

public extension Character {
    var smallThumbnailUrl: URL? {
        guard let path = thumbnail?.path, let imageExtension = thumbnail?.extension else { return nil }
        let url = "\(path)/\(ImageType.standard.rawValue)_\(ImageSize.small.rawValue).\(imageExtension)"
        return URL(string: url)
    }
}
