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
    @State private var timeRemaining = 100
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var isActive = true
    
    
    func removeCard(at index: Int) {
        cards.remove(at: index)
        if cards.isEmpty {
                                       isActive = false
                                   }
    }
    
    func resetCards() {
        cards = [Card](repeating: Card.example, count: 10)
        timeRemaining = 100
        isActive = true
    }
    
    var body: some View {
             
        ZStack {
            
            Image(decorative: "background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Time: \(timeRemaining)")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
                .background(
                    Capsule()
                        .fill(Color.black)
                        .opacity(0.75)
                )
                
                ZStack {
                   
                    ForEach(0..<cards.count, id: \.self) { index in
                        CardView(card: self.cards[index]) {
                            withAnimation {
                                self.removeCard(at: index)
                            }
                           
                        }
                            .stacked(at: index, in: self.cards.count)
                                .allowsHitTesting(index == self.cards.count - 1)
                                .accessibility(hidden: index < self.cards.count - 1)
                        
                        
                    }
                    
                }
            .allowsHitTesting(timeRemaining > 0)
                if cards.isEmpty {
                    Button("Start Again", action: resetCards)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .clipShape(Capsule())
                }
               
            }
            
            
        }
    .onReceive(timer) { time in
        guard self.isActive else { return }
        if self.timeRemaining > 0 {
            self.timeRemaining -= 1
        }
    }
    .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
            self.isActive = false
        }
    .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
        if self.cards.isEmpty == false {
            self.isActive = true
        }
    }
       
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
