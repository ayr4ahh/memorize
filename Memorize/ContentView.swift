//
//  ContentView.swift
//  Memorize
//
//  Created by Ayaan Ackerman on 5/24/25.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🙈", "🐶", "🐭", "🐻", "🐼", "🦁", "🐮", "🐷", "🐸", "🐺", "🐴"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            title
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
        .foregroundColor(Color.blue)
    }
    
    var title: some View {
        Text("Memorize")
            .font(.title)
            .fontDesign(.serif)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "minus.square")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "plus.square")
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.title)
            }
            .opacity(isFaceUp ? 1:0)
            base.fill().opacity(isFaceUp ? 0:1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}










#Preview {
    ContentView()
}
