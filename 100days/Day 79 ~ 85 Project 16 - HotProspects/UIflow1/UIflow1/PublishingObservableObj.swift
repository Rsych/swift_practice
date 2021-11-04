//
//  PublishingObservableObj.swift
//  UIflow1
//
//  Created by Ryan J. W. Kim on 2021/11/04.
//

import SwiftUI

class DelayedUpdater: ObservableObject {
//    @Published var value = 0
    var value = 0 {
        willSet {
            objectWillChange.send()
            // many functionalities can be set with willSet
        }
    }
    
    init() {
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now()  + Double(i)) {
                self.value += 1
            }
        }
    }
}

struct PublishingObservableObj: View {
    // MARK: - Properties
    @ObservedObject var updater = DelayedUpdater()
    
    // MARK: - Body
    var body: some View {
        Text("Value is \(updater.value)")
    }
}

struct PublishingObservableObj_Previews: PreviewProvider {
    static var previews: some View {
        PublishingObservableObj()
    }
}
