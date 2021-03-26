//
//  Model.swift
//  Jokes
//
//  Created by Gary Hanson on 3/8/21.
//

import Foundation
import Combine


struct Joke: Codable {
    let id: Int
    let setup: String
    let punchline: String
}


final class ViewModel: ObservableObject {
    @Published var joke: Joke!
    @Published var topTen: [Joke] = []
    private var disposables = Set<AnyCancellable>()

    func jokeOfTheDay() {
        
        let _ = NetworkData.fetch(url: JokeEndpoint.random.url!, myType: Joke.self)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let theError):
                    print(theError.localizedDescription)
                    //self.handleDownloadError(error: theError)
                }
            }, receiveValue: { joke in
                self.joke = joke
            })
            .store(in: &disposables)
    }
    
    func getTopTen() {
        
        let _ = NetworkData.fetch(url: JokeEndpoint.topTen.url!, myType: [Joke].self)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let theError):
                    print(theError.localizedDescription)
                    //self.handleDownloadError(error: theError)
                }
            }, receiveValue: { joke in
                self.topTen = joke
                if joke.count > 0 {
                    self.joke = self.topTen[0]
                }
            })
            .store(in: &disposables)
    }
}
