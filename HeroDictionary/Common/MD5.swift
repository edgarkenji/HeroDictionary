//
//  MD5.swift
//  HeroDictionary
//
//  Created by Edgar Kenji Yamamoto on 05/12/20.
//

import Foundation
import CryptoKit

func MD5(string: String) -> String {
    let digest = Insecure.MD5.hash(data: string.data(using: .utf8) ?? Data())

    return digest.map {
        String(format: "%02hhx", $0)
    }.joined()
}
