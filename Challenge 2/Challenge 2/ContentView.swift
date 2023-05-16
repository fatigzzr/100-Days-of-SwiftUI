//
//  ContentView.swift
//  Challenge 2
//
//  Created by Fátima González on 12/04/23.
//

import SwiftUI

struct ContentView: View {
    @State private var options = ["✊", "✌️", "✋"].shuffled()
    var optionsEmojis = ["✊", "✌️", "✋"]
    var randomOption = Int.random(in: 0...2)
    @State private var whatTheyShouldDo = Bool.random()
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var showingScore = false
    @State private var contQuestions = 0
    
    var body: some View {
        ZStack
        {
            Color(.black)
                .ignoresSafeArea()
            
            VStack(spacing: 40)
            {
                VStack
                {
                    Text(options[randomOption])
                        .font(.system(size: 100))
                }
                
                HStack
                {
                    if(whatTheyShouldDo)
                    {
                        Text("You need to WIN")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    
                    else
                    {
                        Text("You need to LOSE")
                            .font(.title)
                            .foregroundColor(.white)
                    }

                }
                
                VStack(spacing: 10)
                {
                    VStack
                    {
                        Text("Choose: ")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                        
                    ForEach(0..<3)
                    {
                        number in
                        Button
                        {
                            chosen(optionsEmojis[number])
                        } label:
                        {
                            Text(optionsEmojis[number])
                                .font(.system(size: 50))
                                .frame(width: 200)
                                .padding()
                                .background(Color(red: 0.55, green: 0, blue: 1))
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                    }
                }
                
                Text("Score: \(score)")
                    .font(.title)
                    .foregroundColor(.white)
            }
        }
        .alert(contQuestions != 10 ? scoreTitle:"Restart", isPresented: $showingScore)
        {
            if (contQuestions != 10)
            {
                Button("Continue", action: next)
            }
                
            else
            {
                Button("Restart", action: restart)
            }
        } message: {
            if (contQuestions != 10)
            {
                Text("Your score is: \(score)")
            }
            
            else
            {
                Text("That was \(scoreTitle). The game ended, your final score is: \(score)")
            }
        }
    }
    
    func chosen(_ movement: String)
    {
        if(whatTheyShouldDo)
        {
            scoreTitle = win(movement)
        }
        else
        {
            scoreTitle = lose(movement)
        }
        
        if(scoreTitle == "CORRECT" || scoreTitle == "TIE")
        {
            score += 1
        }
        
        else if(scoreTitle == "INCORRECT")
        {
            score -= 1
        }
        
        showingScore = true
        contQuestions += 1
    }
    
    func win(_ movement: String) -> String
    {
        if(options[randomOption] == "✊")
        {
            switch movement
            {
                case "✌️":
                return "INCORRECT"
                
                case "✋":
                return "CORRECT"
                
                default:
                return "TIE"
            }
        }
        
        else if(options[randomOption] == "✌️")
        {
            switch movement
            {
                case "✋":
                return "INCORRECT"
                
                case "✊":
                return "CORRECT"
                
                default:
                return "TIE"
            }
        }
        
        else if(options[randomOption] == "✋")
        {
            switch movement
            {
                case "✊":
                return "INCORRECT"
                
                case "✌️":
                return "CORRECT"
                
                default:
                return "TIE"
            }
        }
        
        return ""
    }
    
    func lose(_ movement: String) -> String
    {
        if(options[randomOption] == "✊")
        {
            switch movement
            {
                case "✌️":
                return "CORRECT"
                
                case "✋":
                return "INCORRECT"
                
                default:
                return "TIE"
            }
        }
        
        else if(options[randomOption] == "✌️")
        {
            switch movement
            {
                case "✋":
                return "CORRECT"
                
                case "✊":
                return "INCORRECT"
                
                default:
                return "TIE"
            }
        }
        
        else if(options[randomOption] == "✋")
        {
            switch movement
            {
                case "✊":
                return "CORRECT"
                
                case "✌️":
                return "INCORRECT"
                
                default:
                return "TIE"
            }
        }
        
        return ""
    }
    
    func next()
    {
        options.shuffle()
        whatTheyShouldDo = Bool.random()
    }
    
    func restart()
    {
        contQuestions = 0
        score = 0
        next()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
