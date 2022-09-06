//
//  Levels.swift
//  experiment wiht offset
//
//  Created by Thomas King on 22/08/2022.
//

import Foundation

struct QuestionData: Decodable, Identifiable {
    var level: String
    var id: Int
    var modules: [Module]
}

struct Module: Decodable, Identifiable {
    var id: Int
    var name: String
    var sfSymbol: String
    var settings: Settings

}

struct Settings: Decodable {
    var durations: [Duration]
    var clef: Clef?
    var pitches: [Pitch]
    var answers: [String]
}
