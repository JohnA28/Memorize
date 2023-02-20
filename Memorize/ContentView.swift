//
//  ContentView.swift
//  Memorize
//
//  Created by John Alban on 2/14/23.
//

import SwiftUI

struct ContentView: View {
    @State var emojis =
        ["⚽️","🏀","🏈","⚾️","🥎","🏐","🏉","🥏","🏓","🥊","🎱","🏒"]
    @State var emojiEnd = 12
    @State var emojiStart = 0
    
    var body: some View {
        VStack {
            ScrollView {
                Text("Memorize!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    
                //controls how many cards display in 1 row
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    //prints out cards for emoji count using array
                    //emojiStart and emojiEnd are set in button actions
                    ForEach(emojis[emojiStart..<emojiEnd], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3,contentMode:.fit)
                    }
                }
            }
            .foregroundColor(.blue)
        }
        .padding(.horizontal)
        .foregroundColor(.blue)
    }
}


//struct for cards
struct CardView: View {
    var content: String // set at the end of the loop in ContentView
    @State var isFaceUp: Bool = false
    
    
    //card design and content
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth:3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
                
            }
            
        }
        //will "flip" cards when they're tapped
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
