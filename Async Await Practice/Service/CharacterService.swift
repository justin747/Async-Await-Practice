//
//  CharacterService.swift
//  Async Await Practice
//
//  Created by Justin747 on 10/25/21.
//

import Foundation
import SwiftUI

struct CharacterService {
    
    
    enum CharacterServiceError: Error {
        case failed
        case failedToDecode
        case invalidStatusCode
    }
    
    func fetchCharacters() async throws -> [Character] {
        
        let url = URL(string: "https://rickandmortyapi.com/api/character/")!
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
                  throw CharacterServiceError.invalidStatusCode
              }
        
        let decodedData = try JSONDecoder().decode(CharacterServiceResult.self, from: data)
        return decodedData.results
    }
    
}
