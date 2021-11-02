//
//  ImagePickerView.swift
//  NameCarder
//
//  Created by Ryan J. W. Kim on 2021/11/02.
//

import SwiftUI

struct ImagePickerView: View {
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
                Text("Tap to load image")
            } //: Button
            .sheet(isPresented: $showingImagePicker) {
                // ondismiss
            } content: {
                ImagePicker()
            } //: ImagePicker sheet
            
        } //: VStack
    } //: body
} //: ContentView

struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView()
    }
}
