//
//  ContentView.swift
//  Instafilter
//
//  Created by Ryan J. W. Kim on 2021/10/28.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State private var image: Image?
    @State private var showingImagePicker = false
    
    // MARK: - Body
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            
            Button {
                showingImagePicker = true
            } label: {
                Text("Select Image")
            }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker()
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
