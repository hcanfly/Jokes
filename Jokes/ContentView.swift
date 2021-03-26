//
//  ContentView.swift
//  Jokes
//
//  Created by Gary Hanson on 3/8/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    @State private var showingJokeSheet = false
    @State private var showingJokesSheet = false
    
    var body: some View {
        Spacer()

        VStack {
            Text("Joke of the Day")
                .font(.custom("Georgia", size: 36, relativeTo: .title))
                .foregroundColor(Color.red)
                .padding(.bottom, 4)
            
            Button {
                viewModel.jokeOfTheDay()
                showingJokeSheet.toggle()
            } label: {
                Text("Get Joke")
                    .font(.custom("Georgia", size: 30, relativeTo: .title))
                    .foregroundColor(Color.green)
            }
            .sheet(isPresented: $showingJokeSheet) {
                JokeView(vm: viewModel)
            }
        }
        .padding(.bottom, 70)
        
        VStack {
            Text("Top 10 Jokes")
                .font(.custom("Georgia", size: 36, relativeTo: .title))
                .foregroundColor(Color.purple)
                .padding(.bottom, 4)
            
            Button {
                viewModel.getTopTen()
                showingJokesSheet.toggle()
            } label: {
                Text("Get Jokes")
                    .font(.custom("Georgia", size: 30, relativeTo: .title))
                    .foregroundColor(Color.green)
            }
            .sheet(isPresented: $showingJokesSheet) {
                TopTenJokesView(vm: viewModel)
            }
        }
        
        Spacer()
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}
