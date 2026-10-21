//
//  RetainCycle.swift
//  InterviewPrep
//
//  Created by Elena Rubilova on 10/21/26.
//

import SwiftUI

var greeting = "Hello, playground"

class Trainer {
    let name: String
    var client: Client?
    init(name: String) { self.name = name }
    deinit { print("Trainer \(name) freed") }
}

class Client {
    let name: String
    var trainer: Trainer?
    init(name: String) { self.name = name }
    deinit { print("Client \(name) freed") }
}

class WorkoutTimer {
    var seconds = 0
    var onTick: (() -> Void)?

    func start() {
        onTick = { [weak self] in
            guard let self = self else { return }
            self.seconds += 1
            print("Tick: \(self.seconds)")
        }
        onTick?()
    }
    
    deinit { print("WorkoutTimer freed") }
}

struct RetainCycle: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .task {
                do {
                    let elena = Trainer(name: "Elena")
                    let anna = Client(name: "Anna")
                    elena.client = anna
                    //anna.trainer = elena
                }
                print("Done")
            }
    }
        
}

#Preview {
    RetainCycle()
}


