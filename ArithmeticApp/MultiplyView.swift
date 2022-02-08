//
//  MultiplyView.swift
//  ArithmeticApp
//
//  Created by Judy Yu on 2022-02-08.
//

import SwiftUI

struct MultiplyView: View {
    
    // MARK: Stored properties
    let multiplicand = Int.random(in: 1...12)
    let multiplier = Int.random(in: 1...12)
    @State var inputGiven = ""
    
    // Has an answer been checked?
    @State var answerChecked = false
    
    // Was the answer given actually correct?
    @State var answerCorrect = false
    
    // MARK: Computed properties
    // What is the correct product?
    var correctProduct: Int {
        return multiplicand * multiplier
    }
    
    var body: some View {
                
        VStack(spacing: 0) {
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
                Image(systemName: "checkmark.circle")
                    .foregroundColor(.green)
                    //        CONDITION      true  false
                    .opacity(answerCorrect ? 1.0 : 0.0)
                Spacer()
                TextField("Enter Product",
                          text: $inputGiven)
                    .font(.title)
                    .multilineTextAlignment(.trailing)
            }
            
            Button(action: {
                
                // Answer has been checked!
                answerChecked = true
                
                // Convert the input given to an integer, if possible
                guard let productGiven = Int(inputGiven) else {
                    // Sadness, not a number
                    answerCorrect = false
                    return
                }

                // Check the answer!
                if productGiven == correctProduct {
                    // Celebrate! 👍🏼
                    answerCorrect = true
                } else {
                    // Sadness, they gave a number, but it's correct 😭
                    answerCorrect = false
                }
            }, label: {
                Text("Check Answer")
                    .font(.largeTitle)
            })
                .padding()
                .buttonStyle(.bordered)
            
            Spacer()
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 50)
        .font(.system(size: 72))

        
    }
}

struct MultiplyView_Previews: PreviewProvider {
    static var previews: some View {
        MultiplyView()
    }
}
