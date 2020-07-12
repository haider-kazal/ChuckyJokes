//
//  ContentView.swift
//  ChuckyJokes
//
//  Created by Haider Ali Kazal on 12/7/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject
    var viewModel: ContentViewModel
    
    var body: some View {
        VStack(content: {
            Spacer()
            Text(viewModel.jokeText).padding()
            Spacer()
            viewModel.isLoading
                ? AnyView(ProgressView().padding(.bottom, 20).padding(.top, 20))
                : AnyView(Button("New Joke!", action: { viewModel.getNewJoke() }).padding(.bottom, 20).padding(.top, 20))
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(viewModel: .init()).environment(\.colorScheme, .light)
            ContentView(viewModel: .init()).environment(\.colorScheme, .dark)
        }
    }
}
