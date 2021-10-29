//
//  ContentView.swift
//  Instafilter
//
//  Created by Ryan J. W. Kim on 2021/10/29.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(.secondary)
                    // display the image
                    if let image = image {
                        image
                        //                        if image != nil {
                        //                            image
                            .resizable()
                            .scaledToFit()
                    } else {
                        Text("Tap to select a picture")
                            .foregroundColor(.white)
                            .font(.headline)
                    } //: Image input screen
                } //: Zstack
                
                .onTapGesture {
                    showingImagePicker = true
                } //: ontap
                
                HStack {
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                } //: Hstack
                .padding(.vertical)
                
                HStack {
                    Button {
                        // change filter
                    } label: {
                        Text("Change Filter")
                    } //: Filter change button
                    
                    Spacer()
                    
                    Button {
                        // save the picture
                    } label: {
                        Text("Save")
                    } //: Save button
                } //: Hstack
                .padding([.horizontal, .bottom])
                .navigationTitle(Text("Instafilter"))
                .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                    ImagePicker(image: $inputImage)
                }
            } //: Vstack
        } //: NAVview
    } //: body
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
