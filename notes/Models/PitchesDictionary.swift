//
//  PitchesDictionary.swift
//  experiment wiht offset
//
//  Created by Thomas King on 01/08/2022.
//

import SwiftUI

enum Pitch: String, Decodable {
    case E2, F2, G2, A2, B2, C3, D3, E3, F3, G3, A3, B3, C4, D4, E4, F4, G4, A4, B4, C5, D5, E5, F5, G5, A5
}

enum Clef: String, Decodable {
    case bass, treble
}

//0 is always the middle of the stave
let treblePitches: [Pitch: CGFloat] = [.A5: -6,
                                 .G5: -5,
                                 .F5: -4,
                                 .E5: -3,
                                 .D5: -2,
                                 .C5: -1,
                                 .B4: 0,
                                 .A4: 1,
                                 .G4: 2,
                                 .F4: 3,
                                 .E4: 4,
                                 .D4: 5,
                                 .C4: 6]

//0 is always the middle of the stave
let bassPitches: [Pitch: CGFloat] = [.C4: -6,
                                     .B3: -5,
                                     .A3: -4,
                                     .G3: -3,
                                     .F3: -2,
                                     .E3: -1,
                                     .D3: 0,
                                     .C3: 1,
                                     .B2: 2,
                                     .A2: 3,
                                     .G2: 4,
                                     .F2: 5,
                                     .E2: 6]

//below solution does not seem right - surely the CGFloat values should just adapt knowing whether or not the stave is bass or treble clef. if you know what i

//enum StavePosition: String {
//    case bottomOfStave
//    case onFirstLine
//    case aboveFirstLine
//    case onSecondLine
//    case aboveSecondLine
//    case middleOfStave
//    case aboveThirdLine
//    case onFourthLine
//    case aboveFourthLine
//    case onFifthLine
//    case topOfStave
//}
//
//let treblePitches: [Pitch: StavePosition] = [.G4: .topOfStave,
//                                             .F5: .onFifthLine,
//                                             .E5: .aboveFourthLine,
//                                             .D5: .onFourthLine,
//                                             .C5: .aboveThirdLine,
//                                             .B4: .middleOfStave,
//                                             .A4: .aboveSecondLine,
//                                             .G4: .onSecondLine,
//                                             .F4: .aboveFirstLine,
//                                             .E4: .onFirstLine,
//                                             .D4: .bottomOfStave]
//
