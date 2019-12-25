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

//struct ContentView: View {
//
//
//    var body: some View {
//        Text("Hello, World!")
//            .onLongPressGesture(minimumDuration: 1, pressing: { inProgress in
//                print("In progress: \(inProgress)!")
//            }) {
//
//                print("Long pressed!")
//        }
//    }
//}

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Text("Hello, World!")
//                .onTapGesture {
//                    print("Text tapped")
//                }
//        }
//        .onTapGesture {
//            print("VStack tapped")
//        }
//    }
//}

//struct ContentView: View {
//    // how far the circle has been dragged
//    @State private var offset = CGSize.zero
//
//    // where it is currently being dragged or not
//    @State private var isDragging = false
//
//    @State private var engine: CHHapticEngine?
//
//    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//
//    func simpleSuccess() {
//        let generator = UINotificationFeedbackGenerator()
//        generator.notificationOccurred(.success)
//    }
//
//    func prepareHaptics() {
//        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
//
//        do {
//            self.engine = try CHHapticEngine()
//            try engine?.start()
//        } catch {
//            print("There was an error creating the engine: \(error.localizedDescription)")
//        }
//    }
//
//    func complexSuccess() {
//        // make sure that the device supports haptics
//        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
//        var events = [CHHapticEvent]()
//
//        // create one intense, sharp tap
//        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
//        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
//        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
//        events.append(event)
//
//        // convert those events into a pattern and play it immediately
//        do {
//            let pattern = try CHHapticPattern(events: events, parameters: [])
//            let player = try engine?.makePlayer(with: pattern)
//            try player?.start(atTime: 0)
//        } catch {
//            print("Failed to play pattern: \(error.localizedDescription).")
//        }
//    }
//
//
//
//    var body: some View {
////        ZStack {
////            Rectangle()
////                .fill(Color.blue)
////                .frame(width: 300, height: 300)
////                .onTapGesture {
////                    print("Rectangle tapped!")
////                }
////
////            Circle()
////                .fill(Color.red)
////                .frame(width: 300, height: 300)
////                .onTapGesture {
////                    print("Circle tapped!")
////                }
////        .allowsHitTesting(false)
////        }
//
//        Text("Hello, World!")
//        .onReceive(timer) { time in
//            print("The time is now \(time)")
//        }
//
//    }
//
//}
//
////    var body: some View {
////        // a drag gesture that updates offset and isDragging as it moves around
////        let dragGesture = DragGesture()
////            .onChanged { value in self.offset = value.translation }
////            .onEnded { _ in
////                withAnimation {
////                    self.offset = .zero
////                    self.isDragging = false
////                }
////            }
////
////        // a long press gesture that enables isDragging
////        let tapGesture = LongPressGesture()
////            .onEnded { value in
////                withAnimation {
////                    self.isDragging = true
////                }
////            }
////
////        // a combined gesture that forces the user to long press then drag
////        let combined = tapGesture.sequenced(before: dragGesture)
////
////        // a 64x64 circle that scales up when it's dragged, sets its offset to whatever we had back from the drag gesture, and uses our combined gesture
////        return Circle()
////            .fill(Color.red)
////            .frame(width: 64, height: 64)
////            .scaleEffect(isDragging ? 1.5 : 1)
////            .offset(offset)
////            .gesture(combined)
////    }
////}

struct ContentView: View {
//    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
    @State private var counter = 0
//
//    var body: some View {
//        Text("Hello, World!")
//            .onReceive(timer) { time in
//                if self.counter == 5 {
//                    self.timer.upstream.connect().cancel()
//                } else {
//                    print("The time is now \(time)")
//                }
//
//                self.counter += 1
//            }
//    }
//}
    var body: some View {
        CardView(card: Card.example)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
