//
//  ContentView.swift
//  ArithmeticApp
//
//  Created by Judy Yu on 2022-02-07.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: Stored Properties
    let multiplicand = Int.random(in: 1...12)
    let multiplier = Int.random(in: 1...12)
    @State var inputGiven = ""
    
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
                Image(systemName: "checkmark.circle")
                    .foregroundColor(Color.green)
                
                Spacer()
                TextField("Product",
                          text: $inputGiven)
                    .multilineTextAlignment(.trailing)
            }
            Button(action: {
                //check the answer
                guard let productGiven = Int(inputGiven) else {
                    //Sometimes not a number
                    return
                }
                if actualProduct == productGiven {
                    Text("You are right :)")
                } else {
                    Text("Wrong!!")
                }
            }, label: {
                Text("Check Answer")
                    .font(.title)
            })
                .buttonStyle(.bordered)
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
