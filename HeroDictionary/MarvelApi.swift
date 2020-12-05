//
//  MarvelApi.swift
//  HeroDictionary
//
//  Created by Edgar Kenji Yamamoto on 05/12/20.
//

import Foundation

public struct MarvelApiAuth {
    private static var privateKey: String = try! Configuration.value(for: "MARVEL_API_PRIVATE_KEY")
    private static var publicKey: String = try! Configuration.value(for: "MARVEL_API_PUBLIC_KEY")
    
    private static var timestamp: String {
        String(Int(Date().timeIntervalSinceReferenceDate))
    }
    
    private static var hash: String {
        MD5(string: "\(timestamp)\(privateKey)\(publicKey)")
    }
    
    static var params: [String: String] {
        [
            "apikey": publicKey,
            "ts": timestamp,
            "hash": hash
        ]
    }
}

public enum MarvelApi {
    case characters
    
    internal var baseUrl: String { "https://gateway.marvel.com:443/v1/public" }
    
    internal var endpoint: String {
        switch self {
        case .characters:
            return "/characters"
        }
    }
    
    internal var method: String {
        switch self {
        default:
            return "GET"
        }
    }
        
    internal var params: [String : String] {
        return MarvelApiAuth.params
    }
    
    public var request: URLRequest {
        var urlComponents = URLComponents(string: "\(baseUrl)\(endpoint)")
        if method == "GET" {
            let queryItems = params.map { (key, value) -> URLQueryItem in
                URLQueryItem(name: key, value: value)
            }
            urlComponents?.queryItems = queryItems
        }
        guard let requestUrl = urlComponents?.url else {
            fatalError("Invalid URL")
        }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = method
        return request
    }
}
