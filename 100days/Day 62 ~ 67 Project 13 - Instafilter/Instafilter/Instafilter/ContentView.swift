//
//  ContentView.swift
//  Instafilter
//
//  Created by Ryan J. W. Kim on 2021/10/29.
//
import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    
    @State var currentFilter = CIFilter.sepiaTone()
    let context = CIContext()
    // MARK: - Body
    var body: some View {
        let intensity = Binding<Double>(
            get: {
                filterIntensity
            },
            set: {
                filterIntensity = $0
                applyProcessing()
            }
        ) //: Custombinding update filterIntensity and call applyProcessing()
        
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
                    Image(systemName: "minus")
                    Slider(value: intensity)
                        .tint(.green)
                    Image(systemName: "plus")
                } //: Hstack
                .padding(.horizontal)
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
                } //: sheet for img picker
            } //: Vstack
        } //: NAVview
    } //: body
    func loadImage() {
        guard let inputImage = inputImage else { return }
        //        image = Image(uiImage: inputImage)
        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }
    
    func applyProcessing() {
        currentFilter.intensity = Float(filterIntensity)
        guard let outputImage = currentFilter.outputImage
        else { return }
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
        }
    } //: applyprocessing func
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
