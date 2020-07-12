//
//  ContentViewModel.swift
//  ChuckyJokes
//
//  Created by Haider Ali Kazal on 12/7/20.
//

import Alamofire
import Combine
import Foundation

final class ContentViewModel: ObservableObject {
    @Published
    private(set) var joke: JokeState {
        didSet {
            objectWillChange.send()
        }
    }
    
    private var recentPayload: ResponseRootModel? {
        didSet {
            guard let recentPayload = recentPayload else { return }
            joke = .fetched(joke: recentPayload.value.joke)
        }
    }
    
    var isInitial: Bool { joke == .initial }
    
    var isLoading: Bool { joke == .fetching }
    
    var jokeText: String {
        switch joke {
        case let .fetched(joke):
            guard let data = joke.data(using: .utf8) else { return joke }
            
            let attributedStringOptions: [NSAttributedString.DocumentReadingOptionKey: Any] = [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ]
            
            guard let attributedString = try? NSAttributedString(data: data, options: attributedStringOptions, documentAttributes: nil) else {
                return joke
            }
            
            return attributedString.string
            
        default:
            return ""
        }
    }
    
    init() {
        joke = .initial
        getNewJoke()
    }
    
    func getNewJoke() {
        joke = .fetching
        AF.request("https://api.icndb.com/jokes/random")
            .responseDecodable(of: ResponseRootModel.self) { [weak self] (response) in
                switch response.result {
                case let .success(payload):
                    self?.recentPayload = payload
                    
                case let .failure(error):
                    print(error.localizedDescription)
                }
            }
    }
}

enum JokeState: Equatable {
    case initial
    case fetching
    case fetched(joke: String)
}
