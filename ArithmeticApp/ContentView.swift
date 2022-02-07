//
//  ContentView.swift
//  ArithmeticApp
//
//  Created by Judy Yu on 2022-02-07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            HStack(alignment: .center, spacing: 30) {
                Text("✕")
                    .font(.system(size: 52))
                Spacer()
                VStack(alignment: .trailing, spacing: 0) {
                    Text("5")
                    Text("6")
                }
            }
            
            Divider()
            HStack {
                Image(systemName: "checkmark.circle")
                    .foregroundColor(Color.green)
                Spacer()
                Text("30")
                    .font(.system(size: 72))
            }
            Button(action: {
                print("Button was pressed")
            }, label: {
                Text("Check Answer")
                    .font(.system(size: 25))
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
