//
//  Answer.swift
//  experiment wiht offset
//
//  Created by Thomas King on 01/09/2022.
//

import Foundation

struct Answer: Identifiable {
    var id = UUID()
    var answerText: String
    var isCorrect: Bool
}
