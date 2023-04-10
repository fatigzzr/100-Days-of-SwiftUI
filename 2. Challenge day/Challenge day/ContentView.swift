//
//  ContentView.swift
//  Challenge day
//
//  Created by Fátima González on 10/04/23.
//

import SwiftUI

struct ContentView: View {
    @State private var input = 0.0
    @State private var conversionInput = "Celsius"
    @State private var conversionOutput = "Celsius"
    
    let temperatures = ["Celsius", "Fahrenheit", "Kelvin"]
    
    @FocusState private var amountIsFocused: Bool
    
    var conversion: Double
    {
        var inputTemp = Double(input)
        let conversionI = String(conversionInput)
        let conversionO = String(conversionOutput)
        var conversion = 0.0
        
        if conversionI == conversionO
        {
            return inputTemp
        }
        
        switch conversionI
        {
            case "Fahrenheit":
                inputTemp = (inputTemp - 32) * 5/9
    
            case "Kelvin":
                inputTemp = inputTemp - 273.15
            
            default:
                break
        }
        
        switch conversionO
        {
            case "Fahrenheit":
                conversion = (inputTemp * 9/5) + 32
            
            case "Kelvin":
                conversion = inputTemp + 273.15
            
            default:
                conversion = inputTemp
        }
        
        return conversion
    }
    
    var body: some View
    {
        NavigationView
        {
            Form
            {
                Section
                {
                    TextField("Enter a number", value: $input, format: .number)
                        .keyboardType(.numberPad)
                        .focused($amountIsFocused)
                    
                    Picker("", selection:  $conversionInput)
                    {
                        ForEach(temperatures, id: \.self)
                        {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header:
                {
                    Text("Original number")
                        .fontWeight(.bold)
                }
                
                Section
                {
                    Text(String("\(conversion.formatted())"))
                    
                    Picker("", selection:  $conversionOutput)
                    {
                        ForEach(temperatures, id: \.self)
                        {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header:
                {
                    Text("Conversion")
                        .fontWeight(.bold)
                }
            }
            .navigationTitle("Temperature Conversion")
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar
            {
                ToolbarItemGroup(placement: .keyboard)
                {
                    Spacer()
                    
                    Button("Done")
                    {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
