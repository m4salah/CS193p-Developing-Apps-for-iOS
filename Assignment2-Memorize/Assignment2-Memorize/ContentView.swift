//
//  ContentView.swift
//  week1
//
//  Created by Mohamed Abdelkhalek Salah on 01/10/2021.
//

import SwiftUI



struct ContentView: View {

    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
        VStack {
            themeLabel
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(viewModel.themeColor)
            
            Spacer()
            HStack {
                scoreLabel
                Spacer()
                newGameButton
            }
            

        }
        .padding(.horizontal)
    }
    
    var newGameButton: some View {
        Button {
            
        } label: {
            Text("New Game!").font(.title)
        }
    }
    
    var scoreLabel: some View {
        Text("Score: \(viewModel.score)").font(.title2)
    }
    
    var themeLabel: some View {
        Text("\(viewModel.themeName)").font(.title)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20)
        ZStack {
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text("\(card.content)").font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}











struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 12 mini")
    }
}
