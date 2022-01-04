//
//  CoreImageIntegration.swift
//  ViewAndVC
//
//  Created by Ryan J. W. Kim on 2021/10/28.
//
import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct CoreImageIntegration: View {
    // MARK: - Properties
    @State private var image: Image?
    
    
    
    // MARK: - Body
    var body: some View {
        VStack{
            image?
                .resizable()
                .scaledToFit()
            
        } //: Vstack
        .onAppear(perform: loadImage)
    }
    
    func loadImage() {
        guard let inputImage = UIImage(named: "example")
        else { return }
        let beginImage = CIImage(image:  inputImage)
        
        let context = CIContext()
//        let currentFilter = CIFilter.sepiaTone()
//        let currentFilter = CIFilter.pixellate()
        let currentFilter = CIFilter.crystallize()
        
//        currentFilter.setValue(beginImage, forKey: kCIInputImageKey) // old method, use if below fails
        currentFilter.inputImage = beginImage
        
//        currentFilter.intensity = 1 // sepiaTone
//        currentFilter.scale = 10 // pixellate
        currentFilter.radius = 200 // crystallize
        
        // Read image from our filter(CIImage) this might fail to returns an optional
        guard let outputImage = currentFilter.outputImage
        else { return }
        
        // Ask context to create a CGImage from output image, this also might fail so optional
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            
        // Convert that CGImage into a UIImage
            let uiImage = UIImage(cgImage: cgimg)
            
        // Convert that UIImage into SwiftUI Image
            image = Image(uiImage: uiImage)
            
        }
    }
    
}

struct CoreImageIntegration_Previews: PreviewProvider {
    static var previews: some View {
        CoreImageIntegration()
    }
}
