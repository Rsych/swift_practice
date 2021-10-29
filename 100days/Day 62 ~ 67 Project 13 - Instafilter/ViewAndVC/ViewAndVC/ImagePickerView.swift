//
//  ImagePickerView.swift
//  ViewAndVC
//
//  Created by Ryan J. W. Kim on 2021/10/29.
//

import SwiftUI
// MARK: - ImageSave class
class ImageSaver: NSObject {
    func writeToPhotoAlbum(image: UIImage) {
        /*
         immediately saves the image that got loaded, effectively creating a duplicate.
         (First: Image to save,
         Second: object that should be notified about the result of the save,
         Third: one is the method on the object that should be run,
         Forth: we can provide any sort of data here, and it will be passed back to us when our completion method is called)
         */
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
    }
    
    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Save finished!")
    }
}

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
                Text("Select Image")
            } //: Button
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: self.$inputImage)
            } //: Sheet
        } //: VStack
        
    } //: Body
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)

        let imageSaver = ImageSaver()
        imageSaver.writeToPhotoAlbum(image: inputImage)
    } //: loadImage func
} //: ContentView
struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView()
    }
}
