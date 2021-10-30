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
    @State private var processedImage: UIImage?
    
    @State var currentFilter: CIFilter = CIFilter.sepiaTone()
    let context = CIContext()
    
    @State private var showingFilterSheet = false
    
    @State private var imageDidload = false
    
    
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
                        showingFilterSheet = true
                    } label: {
                        Text("Change Filter")
                    } //: Filter change button
                    
                    Spacer()
                    
                    Button {
                        guard let processedImage = processedImage else {
                            imageDidload = true
                            print("Image was not selected")
                            print(imageDidload)
                            return }
                        imageDidload = false
                        print("Image was selected")
                        print(imageDidload)
                        let imageSaver = ImageSaver()
                        
                        imageSaver.successHandler = {
                            print("Success!")
                        }
                        imageSaver.errorHandler = {
                            print("Error \($0.localizedDescription)")
                        }
                        imageSaver.writeToPhotoAlbum(image: processedImage)
                    } label: {
                        Text("Save")
                    } //: Save button
                    .alert("Image was not selected", isPresented: $imageDidload) {
                        Button("Okay") {}
                    } //: Image not selected button
                } //: Hstack
                .padding([.horizontal, .bottom])
                .navigationTitle(Text("Instafilter"))
                .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                    ImagePicker(image: $inputImage)
                } //: sheet for img picker
            } //: Vstack
        } //: NAVview
        .confirmationDialog("Change Filter", isPresented: $showingFilterSheet, titleVisibility: .visible) {
            Button {
                setFilter(.crystallize())
            } label: {
                Text("Crystallize")
            } //: Crystallize
            
            Button {
                setFilter(.edges())
            } label: {
                Text("Edges")
            } //: Edges
            
            Button {
                setFilter(.gaussianBlur())
            } label: {
                Text("Gaussian Blur")
            }
            
            Button {
                setFilter(.pixellate())
            } label: {
                Text("Pixellate")
            }
            
            Button {
                setFilter(.sepiaTone())
            } label: {
                Text("Sepia Tone")
            }
            
            Button {
                setFilter(.unsharpMask())
            } label: {
                Text("Unsharp Mask")
            }
            
            Button {
                setFilter(.vignette())
            } label: {
                Text("Vignette")
            }
        } //: Multiple Actionsheet
        
    } //: body
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        
        applyProcessing()
    }
    
    func applyProcessing() {
        // adapting to each filter params to safely workaround with input param
        let inputKeys = currentFilter.inputKeys
        if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(filterIntensity * 200, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(filterIntensity * 10 , forKey: kCIInputScaleKey) }
        
        guard let outputImage = currentFilter.outputImage
        else { return }
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
            processedImage = uiImage
        }
    } //: applyprocessing func
    
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
    } //: setFilter func
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
