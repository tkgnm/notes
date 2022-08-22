//
//  Levels.swift
//  experiment wiht offset
//
//  Created by Thomas King on 22/08/2022.
//

import Foundation

struct Levels: Decodable, Identifiable {

    var id: Int
    var name: String
    var settings: Settings

}

struct Settings: Decodable {
    var durations: [Duration]
}

//struct Difficulty: Decodable {
//
////    var durations: [Duration]
//    var durations: [String]
//}
