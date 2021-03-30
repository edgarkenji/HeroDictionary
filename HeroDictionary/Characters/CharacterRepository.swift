//
//  CharacterRepository.swift
//  HeroDictionary
//
//  Created by Edgar Kenji Yamamoto on 30/03/21.
//

import Foundation
import Combine

class CharacterRepository: ObservableObject {
    @Published var characters: [HeroDictionary.Character] = [] {
        willSet {
            objectWillChange.send()
        }
    }
    
    private var cancellable: AnyCancellable? = nil
    
    func load() {
        self.cancellable = URLSession
            .shared
            .decodedDataTaskPublisher(for: MarvelApi.characters.request)
            .receive(on: DispatchQueue.main)
            .print()
            .sink { (completion) in
                print(completion)
            } receiveValue: { (wrapper: CharacterDataWrapper) in
                self.characters = wrapper.data?.results ?? []
                print(self.characters)
            }
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}
