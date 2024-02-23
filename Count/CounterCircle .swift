//
//  CounterCircle .swift
//  PomodoroTimer
//
//  Created by Yerasyl Sharipov on 04.12.2022.
//

import Foundation;

class CounterCircle : ObservableObject {
    @Published var countTo : Int
    @Published var counter : Int
}
