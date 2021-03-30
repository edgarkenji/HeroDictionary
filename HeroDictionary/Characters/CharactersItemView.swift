//
//  CharactersItemView.swift
//  HeroDictionary
//
//  Created by Edgar Kenji Yamamoto on 27/02/21.
//

import SwiftUI

struct CharactersItemView: View {
    @State var item: HeroDictionary.Character
    var body: some View {
        HStack {
            AsyncImage(url: item.smallThumbnailUrl!, placeholder: {
                Image(systemName: "person.fill")
            })
            .frame(width: 32, height: 32, alignment: .center)
            .clipShape(Circle())

            Text(item.name ?? "-")
        }
    }
}

struct CharactersItemView_Preview: PreviewProvider {
    static var previews: some View {
        CharactersItemView(item: Character(id: 0, name: "Captain America", description: "Captain America", modified: Date(), thumbnail: nil))
    }
}
