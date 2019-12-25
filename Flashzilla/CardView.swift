//
//  CardView.swift
//  Flashzilla
//
//  Created by Xiaochun Shen on 2019/12/25.
//  Copyright © 2019 SXC. All rights reserved.
//

import SwiftUI

struct CardView: View {
    let card: Card
    @State private var isShowingAnswer = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.white)
                .shadow(radius: 10)
            
            VStack {
                Text(card.prompt)
                    .font(.largeTitle)
                
                if isShowingAnswer {
                    Text(card.answer)
                        .font(.title)
                        .foregroundColor(.secondary)
                    }
            }
            .padding(20)
            .multilineTextAlignment(.center)
            
            
        }
        .frame(width: 450, height: 250)
        .onTapGesture {
            self.isShowingAnswer.toggle()
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example)
    }
}