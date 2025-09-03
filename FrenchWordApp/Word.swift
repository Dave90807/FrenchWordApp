//
//  Word.swift
//  FrenchWordApp
//
//  Created by Dave Cassidy on 9/3/25.
//

import Foundation

struct Word: Identifiable {
    let id = UUID() // Unique identifier for lists and persistence
    let french: String // French word
    let english: String // English translation
}
