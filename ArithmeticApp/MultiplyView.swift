//
//  MultiplyView.swift
//  ArithmeticApp
//
//  Created by Judy Yu on 2022-02-08.
//

import SwiftUI

struct MultiplyView: View {
    
    // MARK: Stored properties
    //@State updates user interface when the values are changed
    @State var multiplicand = Int.random(in: 1...12)
    @State var multiplier = Int.random(in: 1...12)
    //this string contains user input
    @State var inputGiven = ""
    
    // Has an answer been checked?
    @State var answerChecked = false
    
    // Was the answer given actually correct?
    @State var answerCorrect = false
    @State var answerFalse = false
    
    // MARK: Computed properties
    // What is the correct product?
    var correctProduct: Int {
        return multiplicand * multiplier
    }
    
    var body: some View {
        
        VStack(spacing: 20) {
            HStack {
                Text("✕")
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("\(multiplicand)")
                    Text("\(multiplier)")
                }
            }
            
            Divider()
            
            HStack {
                ZStack {
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(Color.green)
                    //        CONDITION      true  false
                        .opacity(answerCorrect ? 1.0 : 0.0)
                    Image(systemName: "xmark.circle")
                        .foregroundColor(Color.red)
                    //        CONDITION      true  false
                        .opacity(answerFalse ? 1.0 : 0.0)
                    // or
                    //  .opacity(answerChecked && answerCorrect == false ? 1.0 : 0.0)
                }
                
                Spacer()
                TextField("Enter Product",
                          text: $inputGiven)
                    .font(.title)
                    .multilineTextAlignment(.trailing)
            }
            
            ZStack {
                if  answerChecked == false {
                    Button(action: {
                        
                        // Answer has been checked!
                        answerChecked = true
                        
                        // Convert the input given to an integer, if possible
                        guard let productGiven = Int(inputGiven) else {
                            // Sadness, not a number
                            answerCorrect = false
                            answerFalse = true
                            return
                        }
                        
                        // Check the answer!
                        if productGiven == correctProduct {
                            // Celebrate! 👍🏼
                            answerCorrect = true
                            answerFalse = false
                        } else {
                            // Sadness, they gave a number, but it's correct 😭
                            answerCorrect = false
                            answerFalse = true
                        }
                    }, label: {
                        Text("Check Answer")
                            .font(.title)
                    })
                        .padding(10)
                        .buttonStyle(GrowingButton())
                } else {
                    
                    Button(action: {
                        answerChecked = false
                        answerCorrect = false
                        answerFalse = false
                        multiplicand = Int.random(in: 1...12)
                        multiplier = Int.random(in: 1...12)
                        inputGiven = ""
                    }, label: {
                        Text("New Question")
                            .font(.title)
                    })
                        .padding(10)
                        .buttonStyle(GrowingButton())
                }
            }
            
            
            Spacer()
        }
        .padding(.horizontal, 50)
        .padding(.vertical, 50)
        .font(.system(size: 72))
        
        
    }
}

struct MultiplyView_Previews: PreviewProvider {
    static var previews: some View {
        MultiplyView()
    }
}
