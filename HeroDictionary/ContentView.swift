//
//  ContentView.swift
//  HeroDictionary
//
//  Created by Edgar Kenji Yamamoto on 05/12/20.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State var cancellable: AnyCancellable?
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear(perform: {
                self.cancellable = URLSession
                    .shared
                    .dataTaskPublisher(for: MarvelApi.characters.request).sink { (completion) in
                        
                    } receiveValue: { (value) in
                        let (data, response) = value
                        print(String(data: data, encoding: .utf8))
                    }
            })
            .onDisappear(perform: {
                cancellable?.cancel()
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
