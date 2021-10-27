//
//  CharacterViewModel.swift
//  Async Await Practice
//
//  Created by Justin747 on 10/26/21.
//

import Foundation

class CharacterViewModel: ObservableObject {
    
    enum State {
        case na
        case loading
        case success(data: [Character])
        case failed(error: Error)
    }
    
    private let service: CharacterService
    
    init(service: CharacterService) {
        self.service = service
    }
    
    func getCharacters() {}
    
}
