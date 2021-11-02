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
    
    @State private var inputImage: UIImage?
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
                loadImage()
            } content: {
                ImagePicker(image: self.$inputImage)
            } //: ImagePicker sheet
            
        } //: VStack
    } //: body
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    } //: loadImg func
} //: ContentView

struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView()
    }
}
