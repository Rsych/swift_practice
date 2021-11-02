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
    
    @State private var isNotNamed:Bool = false
    @State var photoName:String = ""
    // MARK: - Body
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color.white)
                    if let image = image {
                        image
                            .resizable()
                            .scaledToFit()
                        
                    } else {
                        Text("Tab to load image")
                            .foregroundColor(.blue)
                            .font(.headline)
                    } // Image input box
                } //: Zstack
                .onTapGesture {
                    showingImagePicker = true
                }
                .sheet(isPresented: $showingImagePicker) {
                    // ondismiss
                    loadImage()
                    isNotNamed = true
                } content: {
                    ImagePicker(image: $inputImage)
                } //: ImagePicker sheet
                .background(AlertControl(textString: $photoName, show: $isNotNamed, title: "What's the name?", message: "Please input name here."))
                
                Spacer()
                
                //
            } //: VStack
            .navigationTitle(photoName)
        } //: NavVIEW
    } //: body
    // Detect when a new photo is imported, and immediately ask the user to name the photo.
    
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
