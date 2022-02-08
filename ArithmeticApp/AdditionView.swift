//
//  AdditionView.swift
//  ArithmeticApp
//
//  Created by Judy Yu on 2022-02-07.
//

import SwiftUI

struct AdditionView: View {
    
    //MARK: Stored Properties
    @State var addition1 = Int.random(in: 1...50)
    @State var addition2 = Int.random(in: 1...50)
    @State var inputGiven = ""
    
    @State var answerCheck = false
    @State var answerCorrect = false
    @State var answerFalse = false
    
    //MARK: Computed Properties
    var actualSum: Int {
        return addition1 + addition2
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            HStack(alignment: .center, spacing: 0) {
                Text("➕")
                    .font(.system(size: 52))
                Spacer()
                VStack(alignment: .trailing, spacing: 0) {
                    Text("\(addition1)")
                    Text("\(addition2)")
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
                TextField("Enter Sum",
                          text: $inputGiven)
                    .font(.title)
                    .multilineTextAlignment(.trailing)
            }
            Button(action: {
                //answer has been checked
                answerCheck = true
                //check the answer
                guard let sumGiven = Int(inputGiven) else {
                    //Sometimes not a number
                    answerCorrect = false
                    answerFalse = true
                    return
                }
                if actualSum == sumGiven {
                    answerCorrect = true
                    answerFalse = false
                    
                    addition1 = Int.random(in: 1...50)
                    addition2 = Int.random(in: 1...50)
                    
                    inputGiven = ""
                    
                } else {
                    answerFalse = true
                    answerCorrect = false
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

struct AdditionView_Previews: PreviewProvider {
    static var previews: some View {
        AdditionView()
    }
}
