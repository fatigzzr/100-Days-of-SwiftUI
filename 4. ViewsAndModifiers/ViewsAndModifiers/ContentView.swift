//
//  ContentView.swift
//  ViewsAndModifiers
//  3rd Challenge
//
//  Created by Fátima González on 11/04/23.
//

import SwiftUI

struct Title: ViewModifier
{
    func body(content: Content) -> some View
    {
        content
        .font(.largeTitle)
        .foregroundColor(.blue)
        .padding()
    }
}

struct ContentView: View {
    var body: some View {
        VStack
        {
            Text("Hello, my name is Fatima")
                .modifier(Title())
            
            Text("I like Swift")
                .modifier(Title())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
