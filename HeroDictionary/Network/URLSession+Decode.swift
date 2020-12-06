//
//  URLSession+Decode.swift
//  HeroDictionary
//
//  Created by Edgar Kenji Yamamoto on 06/12/20.
//

import Foundation
import Combine

extension URLSession {
    func decodedDataTaskPublisher<T: Decodable>(for request: URLRequest,
                                                handleResponse: ((Data, URLResponse) throws -> Data)? = nil) -> AnyPublisher<T, Error> {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return dataTaskPublisher(for: request)
            .tryMap({ (params) -> Data in
                return try handleResponse?(params.data, params.response) ?? params.data
            })
            .decode(type: T.self, decoder: decoder)
            .print()
            .eraseToAnyPublisher()
    }
}
