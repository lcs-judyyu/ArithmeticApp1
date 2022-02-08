//
//  SubtractionView.swift
//  ArithmeticApp
//
//  Created by Judy Yu on 2022-02-08.
//

import SwiftUI

struct SubtractionView: View {
    
    //MARK: Stored Properties
    @State var minuend = Int.random(in: 51...100)
    @State var subtrahend = Int.random(in: 1...50)
    @State var inputGiven = ""
    
    @State var answerCheck = false
    @State var answerCorrect = false
    @State var answerFalse = false
    
    //MARK: Computed Properties
    var actualDifference: Int {
        return minuend - subtrahend
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            HStack(alignment: .center, spacing: 0) {
                Text("➖")
                    .font(.system(size: 52))
                Spacer()
                VStack(alignment: .trailing, spacing: 0) {
                    Text("\(minuend)")
                    Text("\(subtrahend)")
                }
            }
            
            Divider()
            HStack {
                ZStack {
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(Color.green)
                        .opacity(answerCorrect ? 1.0 : 0.0)
                    Image(systemName: "xmark.circle")
                        .foregroundColor(Color.red)
                        .opacity(answerFalse ? 1.0 : 0.0)
                }
                
                Spacer()
                TextField("Enter difference",
                          text: $inputGiven)
                    .font(.title)
                    .multilineTextAlignment(.trailing)
            }
            ZStack {
                    Button(action: {
                        
                        // Answer has been checked!
                        answerCheck = true
                        
                        // Convert the input given to an integer, if possible
                        guard let differenceGiven = Int(inputGiven) else {
                            // Sadness, not a number
                            answerCorrect = false
                            answerFalse = true
                            return
                        }
                        
                        // Check the answer!
                        if differenceGiven == actualDifference {
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
                        .buttonStyle(GrowingButton())
                        .opacity(answerCheck ? 0.0 : 1.0)

                    
                    Button(action: {
                        answerCheck = false
                        answerCorrect = false
                        answerFalse = false
                        minuend = Int.random(in: 1...50)
                        subtrahend = Int.random(in: 1...50)
                        inputGiven = ""
                    }, label: {
                        Text("New Question")
                            .font(.title)
                    })
                        .buttonStyle(GrowingButton())
                        .opacity(answerCheck ? 1.0 : 0.0)
                }
            Spacer()
        }
        .font(.system(size: 72))
        .padding(.horizontal, 50)
        .padding(.vertical, 40)
    }
}

struct SubtractionView_Previews: PreviewProvider {
    static var previews: some View {
        SubtractionView()
    }
}
