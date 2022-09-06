//
//  StaveView.swift
//  experiment wiht offset
//
//  Created by Thomas King on 01/08/2022.
//

import SwiftUI

struct Stave: View {
    
    var noteValue: Duration
    var pitches: [Pitch]

//    put the clef in the ZStack
    var clef: Clef?

//    because this may change depending on user preference
    var staveThickness: CGFloat = 4
    var staveLineSpacing: CGFloat {
        staveThickness * 4
    }

    var body: some View {
        ZStack {
//            Rectangle()
//                .frame(width: 100, height: 20 * 4)
            VStack(spacing: staveLineSpacing) {
//                spacing 16 + 4 height = 20 px per whole line,
//                & 10px per half line
                StaveLine(thickness: staveThickness)
                StaveLine(thickness: staveThickness)
                StaveLine(thickness: staveThickness)
                StaveLine(thickness: staveThickness)
                StaveLine(thickness: staveThickness)
            }
            Note(value: noteValue, pitch: pitches[0], clef: clef ?? .treble)
        }
        .frame(width: 500, height: 200)
    }
}

struct StaveView_Previews: PreviewProvider {
    static var previews: some View {
        Stave(noteValue: .semibreve, pitches: [.B4])
    }
}
