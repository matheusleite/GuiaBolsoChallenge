//
//  Joke.swift
//  GuiaBolsoChallenge
//
//  Created by Matheus Leite on 26/06/19.
//  Copyright © 2019 Matheus Leite. All rights reserved.
//

import Foundation

class Joke: Decodable {
    var id: String
    var value: String
    var url: String
    var icon_url: String
}
