//
//  ContentView.swift
//  Memorize
//
//  Created by Ayaan Ackerman on 5/24/25.
///

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .padding()
        .foregroundColor(Color.blue)
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("🙈").font(.title)
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
        }
    }
}











#Preview {
    ContentView()
}
