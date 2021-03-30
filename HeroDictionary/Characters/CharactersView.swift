//
//  CharactersView.swift
//  HeroDictionary
//
//  Created by Edgar Kenji Yamamoto on 27/12/20.
//

import SwiftUI

struct CharactersView : View {
    @Binding var items: [HeroDictionary.Character]
    var body: some View {
        List {
            ForEach(items, id: \.id) { item in
                CharactersItemView(item: item)
            }
        }
    }
}

struct CharactersView_Preview : PreviewProvider {
    static var previews: some View {
        CharactersView(items: .constant([
            Character(id: 0, name: "Iron-man", description: "Iron-man", modified: Date(), thumbnail: ImageUrl(path: "http://i.annihil.us/u/prod/marvel/i/mg/4/60/52695285d6e7e", extension: "jpg")),
            Character(id: 1, name: "Spider-man", description: "Spider-man", modified: Date(), thumbnail: nil),
        ]))
    }
}
