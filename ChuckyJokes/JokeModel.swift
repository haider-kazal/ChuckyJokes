//
//  JokeModel.swift
//  ChuckyJokes
//
//  Created by Haider Ali Kazal on 12/7/20.
//

import Foundation

struct JokeModel: Codable {
    let id: Int
    let joke: String
    let categories: [String]
}
