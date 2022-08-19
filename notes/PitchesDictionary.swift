//
//  PitchesDictionary.swift
//  experiment wiht offset
//
//  Created by Thomas King on 01/08/2022.
//

import SwiftUI

enum Pitch: String {
    case D4, E4, F4, G4, A4, B4, C5, D5, E5, F5, G5, A5
}

let pitches: [Pitch: CGFloat] = [.A5: -60,
                                  .G5: -50,
                                  .F5: -40,
                                  .E5: -30,
                                  .D5: -20,
                                  .C5: -10,
                                  .B4: 0,
                                  .A4: 10,
                                  .G4: 20,
                                  .F4: 30,
                                  .E4: 40,
                                  .D4: 50]
