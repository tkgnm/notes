//
//  Levels.swift
//  experiment wiht offset
//
//  Created by Thomas King on 22/08/2022.
//

import Foundation

struct Levels: Decodable {

    var difficulty: String

}

struct Difficulty: Decodable {

    var durations: [Duration]
}
