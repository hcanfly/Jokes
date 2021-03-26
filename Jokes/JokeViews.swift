//
//  JokeViews.swift
//  Jokes
//
//  Created by Gary Hanson on 3/25/21.
//

import SwiftUI

struct TopTenJokesView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var vm: ViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach((0..<9), id: \.self) { index in
                    DisclosureGroup(
                        content: {
                            JokeTextView(text: vm.topTen.count > index ? vm.topTen[index].punchline : "Joke goes here", fontSize: 20)
                        },
                        label: {
                            JokeTextView(text: vm.topTen.count > index ? vm.topTen[index].setup : "Joke goes here", fontSize: 20)
                        }
                    )
                }
                .frame(height: 140)
                .padding(.horizontal, 10)
                .background(Color("ScrollviewBackgroundColor"))
                
                Image("Monkeys")
                    .resizable()
                    .frame(width: 300, height: 330)
                    .aspectRatio(contentMode: .fill)
                    .padding()
            }
        }
        
        Button("Press to dismiss") {
            presentationMode.wrappedValue.dismiss()
        }
        .font(.title3)
        .foregroundColor(.green)
    }
}

struct JokeView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var vm: ViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            JokeTextView(text: vm.joke != nil ? vm.joke!.setup : "Joke of the Day", fontSize: 24)

            JokeTextView(text: vm.joke != nil ? vm.joke!.punchline : "", fontSize: 24)

            Image("Monkeys")
                .resizable()
                .frame(width: 300, height: 330)
                .aspectRatio(contentMode: .fill)
                .padding()
            Spacer()
        }
        
        Button("Press to dismiss") {
            presentationMode.wrappedValue.dismiss()
        }
        .font(.title3)
    }
}

struct JokeTextView: View {
    let text: String
    let fontSize: CGFloat
    
    var body: some View {
        Text(text)
            .font(.custom("Georgia", size: fontSize, relativeTo: .title))
            .foregroundColor(Color("JokeTextColor"))
            .padding(.bottom, 10)
            .padding(.horizontal, 20)
    }
}
