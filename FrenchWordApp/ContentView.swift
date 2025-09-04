//
//  ContentView.swift
//  FrenchWordApp
//
//  Created by Dave Cassidy on 9/3/25.
//  Grok assisted in planning and producing

import SwiftUI

struct ContentView: View {
    // @State for currentWord, mutable to change with new word selection
    @State private var currentWord: Word // @State allows changes to this variable to be tracked
    // @State for user's typed translation, bound to TextField
    @State private var userInput = ""
    // @State for feedback (nil = no feedback, true = correct, false = incorrect
    @State private var isCorrect: Bool?
    
    // Static list of sample words, using 'let' because it won't change after initialization
    private let sampleWords = [          // let creates constants
        Word(french: "bonjour", english: "hello"),
        Word(french: "au revoir", english: "goodbye"),
        Word(french: "merci", english: "thank you"),
        Word(french: "chien", english: "dog")
    ]
    
    // Initializer to set default currentWord (outside of initialization of sampleWords)
    init() {
        // Set initial word safely, avoiding force-unwrap (!), meaning (what exactly?)
        // The actual value of currentWord is set when in the @State wrapper by referring
        // to currentWord with a preceeding underscore _currenWord
        _currentWord = State(initialValue: sampleWords.randomElement() ?? Word(french: "bonjour", english: "hello"))
    }
    
    var body: some View {
        // VStack for vertical layout, spacing adds gaps between elements
        VStack(spacing:20) {
            // Title of the App
            Text("French Word of the Day")
                .font(.title)
            // Display the French word, styled prominently
            Text(currentWord.french)
                .font(.largeTitle)
                .foregroundColor(.blue)
            // Q: Why use $userInput?  A: Binding for two-way TextField updates
            TextField("Enter English Translation", text: $userInput)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            //Button to check the user's input against correct translation
            Button("Check Answer") {
                // Compare lowercase to ignore case sensitivity
                isCorrect = userInput.lowercased() == currentWord.english.lowercased()
                userInput = ""// Clear input after checking
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            // Conditional feedback based on isCorrect
            if let isCorrect = isCorrect {
                Text(isCorrect ? "Correct!": "Incorrect, try again!")
                    .foregroundColor(isCorrect ? .green : .red)
            }
            // Button to pick a new random word
            Button("New Word") {
                // Q: Why currentWord, not _currentWord?  A: currentWord updates the value, _currentWord is for init()
                currentWord = sampleWords.randomElement() ?? sampleWords[0]
                userInput = "" // Clear input
                isCorrect = nil  // Reset feedback
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding() // Padding around entire VStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
    }
}
