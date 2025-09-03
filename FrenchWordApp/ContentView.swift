//
//  ContentView.swift
//  FrenchWordApp
//
//  Created by Dave Cassidy on 9/3/25.
//  Grok assisted in planning and producing

import SwiftUI

struct ContentView: View {
    // @State manages a single Word, updated when the user taps "New Word"
    @State private var currentWord: Word

    // Static list of sample words, suing 'let'because it won't change after initialization
    private let sampleWords = [
        Word(french: "bonjour", english: "hello"),
        Word(french: "au revoir", english: "goodbye"),
        Word(french: "merci", english: "thank you"),
        Word(french: "chien", english: "dog")
    ]
    
    // Initializer to set default currentWord (outside of initialization of sampleWords)
    init() {
        // Set initial word safely, avoiding force-unwrap (!), meaning (what exactly?)
        _currentWord = State(initialValue: sampleWords.randomElement() ?? Word(french: "bonjour", english: "hello"))
    }
    
    var body: some View {
        VStack(spacing:20) {
            Text("French Word of the Day")
                .font(.title)
            Text(currentWord.french)
                .font(.largeTitle)
                .foregroundColor(.blue)
            Text("Translation: \(currentWord.english)")
                .font(.title2)
                .foregroundColor(.gray)
            Button("New Word") {
                currentWord = sampleWords.randomElement()!
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
    }
}
