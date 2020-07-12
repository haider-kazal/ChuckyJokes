//
//  ResponseRootModel.swift
//  ChuckyJokes
//
//  Created by Haider Ali Kazal on 12/7/20.
//

import Foundation

struct ResponseRootModel: Codable {
    let type: String
    let value: JokeModel
}
