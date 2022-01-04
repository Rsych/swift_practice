//
//  TriggerTimer.swift
//  Monitoring
//
//  Created by Ryan J. W. Kim on 2021/11/08.
//

import SwiftUI

struct TriggerTimer: View {
    // MARK: - Properties
    
    // MARK: - Timer
    /*
     1. timer to fire every 1sec
     2. timer should run on the main thread
     3. timer should run on the common run loop. (Run loops lets iOS handle running code while the user is actively doing something, such as scrolling in a list.)
     4. connects the timer immediately
     5. assigns the whole thing to the timer constant so that it stays alive.
    */
    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
    @State private var counter = 0
    // MARK: - Body
    var body: some View {
        Text("Hello, World!")
            .onReceive(timer) { time in
                if counter == 5 {
                    timer.upstream.connect().cancel()
                } else {
                    print("The time is now \(time)")
                }
                counter += 1
            }
        
    }
}

struct TriggerTimer_Previews: PreviewProvider {
    static var previews: some View {
        TriggerTimer()
    }
}
