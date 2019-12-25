//
//  Card.swift
//  Flashzilla
//
//  Created by Xiaochun Shen on 2019/12/25.
//  Copyright © 2019 SXC. All rights reserved.
//

import Foundation

struct Card {
    let prompt: String
    let answer: String
    
    static var example: Card {
        return Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
    }
}
