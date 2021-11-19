//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by Ryan J. W. Kim on 2021/11/17.
//

import SwiftUI

struct WelcomeView: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        VStack {
            Text("Welcome to SnowSeeker!")
                .font(.largeTitle)
            
            Text("Please select a resort from the left-hand menu; \nSwipe from the left edge to show it.")
                .foregroundColor(.secondary)
        } //: Vstack
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
