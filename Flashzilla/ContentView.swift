//
//  ContentView.swift
//  Flashzilla
//
//  Created by Xiaochun Shen on 2019/12/19.
//  Copyright © 2019 SXC. All rights reserved.
//

import SwiftUI
import CoreHaptics

//struct ContentView: View {
//    @State private var currentAmount: CGFloat = 0
//    @State private var finalAmount: CGFloat = 1
//
//    var body: some View {
//        Text("Hello, World!")
//            .scaleEffect(finalAmount + currentAmount)
//            .gesture(
//                MagnificationGesture()
//                    .onChanged { amount in
//                        self.currentAmount = amount - 1
//                    }
//                    .onEnded { amount in
//                        self.finalAmount += self.currentAmount
//                        self.currentAmount = 0
//                    }
//            )
//    }
//}

struct ContentView: View {
    
    @State var engine: CHHapticEngine?
    
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

        do {
            self.engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
    }
    
    func complexSuccess() {
        // make sure that the device supports haptics
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        var events = [CHHapticEvent]()

        // create one intense, sharp tap
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
        events.append(event)

        // convert those events into a pattern and play it immediately
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription).")
        }
    }
    
    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    var body: some View {
        Text("Hello, World!")
        .onAppear(perform: prepareHaptics)
            .onTapGesture(perform: complexSuccess)
//            .onTapGesture {
//                print("Double tapped!")
//            .onLongPressGesture {
//                print("Long pressed!")
//        }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
