//
//  AsyncImage.swift
//  HeroDictionary
//
//  Created by Edgar Kenji Yamamoto on 27/12/20.
//

import SwiftUI

struct AsyncImage<Placeholder: View>: View {
    @StateObject private var loader: ImageLoader
    private let placeholder: Placeholder

    init(url: URL, @ViewBuilder placeholder: () -> Placeholder) {
        self.placeholder = placeholder()
        _loader = StateObject(wrappedValue: ImageLoader(url: url))
    }

    var body: some View {
        content
            .onAppear(perform: loader.load)
    }

    private var content: some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image!)
                    .resizable()
                    .scaledToFill()
            } else {
                placeholder
            }
        }
    }
}


struct AsyncImage_Preview : PreviewProvider {
    static var previews: some View {
        AsyncImage(url: URL(string: "https://i.picsum.photos/id/526/200/300.jpg?hmac=Xtm9XW9i9d69kjGxmnZYyvJRyY3VKqYwjw_Yq9Z1YBU")!,
                   placeholder: { Text("now loading...") })
    }
}
