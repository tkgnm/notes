//
//  BundleExtensions.swift
//  experiment wiht offset
//
//  Created by Thomas King on 22/08/2022.
//

import Foundation

extension Bundle {

    func decode(_ file: String) -> [Levels] {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode([Levels].self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}
