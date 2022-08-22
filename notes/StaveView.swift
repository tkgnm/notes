//
//  StaveView.swift
//  experiment wiht offset
//
//  Created by Thomas King on 01/08/2022.
//

import SwiftUI

struct StaveView: View {
    
    var noteValue: Duration
    var pitches: [Pitch]
    var padding: CGFloat = 4
    
    var halfStepSpacing: CGFloat {
        return padding * 2.5
    }
    
    var body: some View {
        
        ZStack {
            VStack {
                StaveLineView(padding: padding)
                StaveLineView(padding: padding)
                StaveLineView(padding: padding)
                StaveLineView(padding: padding)
                StaveLineView(padding: padding)
            }
            NoteView(value: noteValue, pitch: pitches[0])
        }
        .frame(width: 500, height: 200)
    }
}

struct StaveView_Previews: PreviewProvider {
    static var previews: some View {
        StaveView(noteValue: .semibreve, pitches: [.E5])
    }
}
