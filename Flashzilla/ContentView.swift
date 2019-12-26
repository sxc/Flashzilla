//
//  ContentView.swift
//  Flashzilla
//
//  Created by Xiaochun Shen on 2019/12/19.
//  Copyright © 2019 SXC. All rights reserved.
//

import SwiftUI
import CoreHaptics



extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = CGFloat(total - position)
        return self.offset(CGSize(width: 0, height: offset * 10))
    }
}



struct ContentView: View {
    @State private var cards = [Card](repeating: Card.example, count: 10)
    func removeCard(at index: Int) {
        cards.remove(at: index)
    }
    
    var body: some View {
        
        
//        CardView(card: Card.example)
        
        ZStack {
            Image("background")
                                                     .resizable()
                                                     .scaledToFill()
                                                     .edgesIgnoringSafeArea(.all)
            
           
            VStack {
                ZStack {
                   
                    ForEach(0..<cards.count, id: \.self) { index in
                        CardView(card: self.cards[index]) {
                            withAnimation {
                                self.removeCard(at: index)
                            }
                        }
                            .stacked(at: index, in: self.cards.count)
                        
                        
                    }
                    
                }
               
            }
            
        }
       
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
