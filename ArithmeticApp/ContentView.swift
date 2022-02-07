//
//  ContentView.swift
//  ArithmeticApp
//
//  Created by Judy Yu on 2022-02-07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 60) {
            HStack(alignment: .center, spacing: 30) {
                Text("✕")
                    .font(.system(size: 52))
                Spacer()
                VStack(alignment: .trailing, spacing: 0) {
                    Text("5")
                    Text("6")
                }
                .padding(20)
            }
            .font(.system(size: 72))
            Divider()
            Text("30")
                .font(.system(size: 72))
            Button(action: {
                print("Button was pressed")
            }, label: {
                Text("Check Answer")
            })
                .buttonStyle(.bordered)
            Spacer()
        }
        .padding(60)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
