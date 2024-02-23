//
//  CircularTimer.swift
//  PomodoroTimer
//
//  Created by Yerasyl Sharipov on 02.12.2022.
//

import SwiftUI

let timer1 = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect()

struct CircularTimer: View {
    @State var counter: Int = 0
    var countTo: Int = 120
    var nowDate = Date()
    var futureDate = Date.distantFuture
    var body: some View {
        VStack{
            ZStack{
                Circle()
                    .fill(Color.clear)
                    .frame(width: 250, height: 250)
                    .overlay(
                        Circle().stroke(Color.green, lineWidth: 25)
                    )
                
                Circle()
                    .fill(Color.clear)
                    .frame(width: 250, height: 250)
                    .overlay(
                        Circle().trim(from:0, to: progress())
                            .stroke(
                                style: StrokeStyle(
                                    lineWidth: 25,
                                    lineCap: .round,
                                    lineJoin:.round
                                )
                            )
                            .foregroundColor(
                                (completed() ? Color.orange : Color.red)
                            ).animation(
                                .easeInOut(duration: 0.2)
                            )
                    )
            }
        }.onReceive(timer) { time in
            if (self.counter < self.countTo) {
                self.counter += 1
            }
            
        }
    }
    func completed() -> Bool {
        return progress() == 1
    }
    
    func progress() -> CGFloat {
        return (CGFloat(counter) / CGFloat(countTo))
    }
}
