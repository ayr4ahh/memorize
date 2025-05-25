//
//  ContentView.swift
//  Memorize
//
//  Created by Ayaan Ackerman on 5/24/25.
///

import SwiftUI

struct ContentView: View {
    let emojis = ["🙈", "🐶", "🐭", "🐻", "🐼", "🦁", "🐮", "🐷", "🐸", "🐺", "🐴"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            HStack {
                ForEach(0..<cardCount, id: \.self) { index in
                    CardView(content: emojis[index])
                }
            }
            .foregroundColor(Color.blue)
            
            HStack {
                Button("Remove Card") {
                    cardCount -= 1
                }
                Spacer()
                Button("Add Card") {
                    cardCount += 1
                }
            }
            .imageScale(.large)
            .font(.largeTitle)
        }
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.title)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}










#Preview {
    ContentView()
}
