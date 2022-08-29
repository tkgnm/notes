//
//  ProgressBar.swift
//  experiment wiht offset
//
//  Created by Thomas King on 28/08/2022.
//

import SwiftUI

struct ProgressBar: View {

    @State var value = 0.5

    var body: some View {
        GeometryReader { geometry in
            RoundedRectangle(cornerRadius: 5, style: .continuous)
                .frame(width: geometry.size.width * value, height: 10)
                .foregroundColor(value < 0.2 ? .red : .blue)
                .padding(5)
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar()
    }
}
