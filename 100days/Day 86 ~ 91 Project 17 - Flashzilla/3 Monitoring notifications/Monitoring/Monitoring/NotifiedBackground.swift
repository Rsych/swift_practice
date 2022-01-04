//
//  NotifiedBackground.swift
//  Monitoring
//
//  Created by Ryan J. W. Kim on 2021/11/08.
//

import SwiftUI

struct NotifiedBackground: View {
    var body: some View {
        /*
         UIApplication.significantTimeChangeNotification is called when the user changes their clock or when daylight savings time changes.
         UIResponder.keyboardDidShowNotification is called when the keyboard is shown.
         */
        //        Text("Hello, World!")
        //            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
        //                print("Moving to the background!")
        //            }
        
        //        Text("Hello, World!")
        //            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
        //                print("Moving back to the foreground!")
        //            }
        
        Text("Hello, World!")
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.userDidTakeScreenshotNotification)) { _ in
                print("User took a screenshot!")
            }
    }
}

struct NotifiedBackground_Previews: PreviewProvider {
    static var previews: some View {
        NotifiedBackground()
    }
}
