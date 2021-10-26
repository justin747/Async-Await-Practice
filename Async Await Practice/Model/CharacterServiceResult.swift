//
//  CharacterServiceResult.swift
//  Async Await Practice
//
//  Created by Justin747 on 10/25/21.
//

import Foundation

struct CharacterServiceResult: Codable {
    let results: [Character]
}

struct Character: Codable {
    let id: Int
    let name: String
}
