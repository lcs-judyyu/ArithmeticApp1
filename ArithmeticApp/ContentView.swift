//
//  ContentView.swift
//  ArithmeticApp
//
//  Created by Judy Yu on 2022-02-07.
//

import SwiftUI

//button style
struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 10)
            .padding(.horizontal, 15)
            .background(configuration.isPressed ? Color.blue.opacity(0.2) : Color.blue.opacity(0.06))
            .foregroundColor(.black)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.blue, lineWidth: 2)
            )
            .scaleEffect(configuration.isPressed ? 1.06 : 1)
            .animation(.easeOut(duration: 0.1), value: configuration.isPressed)
    }
}

struct ContentView: View {
    
    //MARK: Stored Properties
    @State var multiplicand = Int.random(in: 1...12)
    @State var multiplier = Int.random(in: 1...12)
    @State var inputGiven = ""
    
    @State var answerCheck = false
    @State var answerCorrect = false
    @State var answerFalse = false
    
    //MARK: Computed Properties
    var actualProduct: Int {
        return multiplicand * multiplier
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            HStack(alignment: .center, spacing: 0) {
                Text("✕")
                    .font(.system(size: 52))
                Spacer()
                VStack(alignment: .trailing, spacing: 0) {
                    Text("\(multiplicand)")
                    Text("\(multiplier)")
                }
            }
            
            Divider()
            HStack {
                ZStack {
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(Color.green)
                        .animation(.easeIn(duration: 2), value: 1)
                        .opacity(answerCorrect ? 1.0 : 0.0)
                    
                    Image(systemName: "xmark.circle")
                        .foregroundColor(Color.red)
                        .animation(.easeIn(duration: 2), value: 1)
                        .opacity(answerFalse ? 1.0 : 0.0)
                    
                }
                
                Spacer()
                TextField("Enter Product",
                          text: $inputGiven)
                    .font(.title)
                    .multilineTextAlignment(.trailing)
            }
            Button(action: {
                //answer has been checked
                answerCheck = true
                //check the answer
                guard let productGiven = Int(inputGiven) else {
                    //Sometimes not a number
                    answerCorrect = false
                    answerFalse = true
                    return
                }
                if actualProduct == productGiven {
                    withAnimation(.easeIn(duration: 2)) {
                        answerCorrect = true
                        answerFalse = false
                    }
                    
                    multiplicand = Int.random(in: 1...12)
                    multiplier = Int.random(in: 1...12)
                    
                    inputGiven = ""
                    
                    
                } else {
                    withAnimation(.easeIn(duration: 2)) {
                        answerFalse = true
                        answerCorrect = false
                    }
                }
            }, label: {
                
                Text("Check Answer")
                    .font(.title)
            })
                .buttonStyle(GrowingButton())
            Spacer()
        }
        .font(.system(size: 72))
        .padding(.horizontal, 50)
        .padding(.vertical, 40)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
