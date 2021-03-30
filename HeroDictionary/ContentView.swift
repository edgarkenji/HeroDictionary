//
//  ContentView.swift
//  HeroDictionary
//
//  Created by Edgar Kenji Yamamoto on 05/12/20.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var repository = CharacterRepository()
        
    var body: some View {
        CharactersView(items: self.$repository.characters)
            .onAppear(perform: {
                repository.load()
            })
            .onDisappear(perform: {
                repository.cancel()
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
