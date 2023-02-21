//
//  ContentView.swift
//  Memorize
//
//  Created by John Alban on 2/14/23.
//

import SwiftUI

struct ContentView: View {
    
    //ObservedObject allows the UI to rebuild when viewmodel changes
   @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        ScrollView {
            //controls how many cards display in 1 row
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                //prints out cards for emoji count using array
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3,contentMode:.fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                    
                }
                
            }
            
        }
        .foregroundColor(.blue)
        .padding(.horizontal)
    }
}


//struct for cards
struct CardView: View {
    var card: MemoryGame<String>.Card
    
    
    //card design and content
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth:3)
                Text(card.content).font(.largeTitle)
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
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
