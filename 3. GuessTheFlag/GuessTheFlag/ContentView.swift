//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Fátima González on 10/04/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var flagTappedName = ""
    @State private var limit = false
    @State private var contQuestions = 0
     
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack
        {
            RadialGradient(stops: [
                .init(color: Color(red: 0.45, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: .black, location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 490)
                .ignoresSafeArea()
            
            VStack
            {
                Spacer()
                
                Text("Guess the Flag")
                    .foregroundColor(.white)
                    .font(.largeTitle.bold())
                
                VStack(spacing: 30)
                {
                    VStack(spacing: 5)
                    {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3)
                    { number in
                        Button
                        {
                            flagTapped(number)
                        } label:
                        {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        
        .alert(scoreTitle, isPresented: $showingScore)
        {
            if(contQuestions != 8)
            {
                Button("Continue", action: askQuestion)
            }
            
            else
            {
                Button("Restart", action: reset)
            }
        } message:
        {
            if(scoreTitle == "Correct" && contQuestions != 8)
            {
                Text("Your score is \(score)")
            }
            
            else if(contQuestions != 8)
            {
                Text("Wrong! That's the flag of \(flagTappedName)")
            }
            
            else
            {
                Text("You already answered 8 questions! Final score: \(score)")
            }
        }
    }
    
    func flagTapped(_ number: Int)
    {
        if(number == correctAnswer)
        {
            scoreTitle = "Correct"
            score += 1
        }
        
        else
        {
            scoreTitle = "Wrong"
            flagTappedName = countries[number]
        }
        
        showingScore = true
        contQuestions += 1
        
        if(contQuestions == 8)
        {
            limit = true
        }
    }
    
    func askQuestion()
    {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func reset()
    {
        score = 0
        contQuestions = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
