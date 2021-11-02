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
    
    @State var saveDisabled = true
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    // MARK: - Body
    var body: some View {
        NavigationView {
            Form {
                Section {
                    if let image = image {
                        HStack {
//                            Spacer()
                            image
                                .resizable()
                                .scaledToFit()
                                .aspectRatio(contentMode: .fill)
//                                .frame(width: 250, height: 250, alignment: .center)
                                .shadow(color: .secondary, radius: 5, x: 20, y: 20)
                                .shadow(color: .secondary, radius: 5, x: -20, y: -20)
//                            Spacer()
                        } //: Hstack
                    } else {
                        HStack {
//                            Spacer()
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
//                                .frame(width: 250, height: 250, alignment: .center)
//                            Spacer()
                        } //: Hstack
                    } // Image input box
                } header: {
                    Text("Tap to upload image")
                    
                } //: Section 1
                .onTapGesture {
                    showingImagePicker = true
                } //: Tap gesture to show picker
                
                Section {
                    Text("Name is \(photoName)")
                } //: Section 2 name display
                .opacity(saveDisabled ? 0:1)
                
                
            } //: VStack
            .sheet(isPresented: $showingImagePicker) {
                // ondismiss
                upLoadImage()
            } content: {
                ImagePicker(image: $inputImage)
            } //: ImagePicker sheet
            .background(AlertControl(textString: $photoName, show: $isNotNamed, title: "What's the name?", message: "Please input name here."))
            .navigationTitle("NameCard")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // save
                        saveInfo()
                    } label: {
                        Text("Save")
                    } //: Button
                    .disabled(saveDisabled)
                }
            } //: Save button on top right
        } //: NavVIEW
    } //: body
    
    
    
    func upLoadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        isNotNamed = true
        saveDisabled.toggle()
    } //: uploading image to view func
    
    func saveInfo() {
        let pickedImage = inputImage?.jpegData(compressionQuality: 0.80)
        let pickedName = photoName
        let person = Person(context: self.moc)
        person.image = pickedImage
        person.name = pickedName
        person.id = UUID()
        
        try? self.moc.save()
//        self.presentationMode.wrappedValue.dismiss()
        print("Info is saved")
//        print(person.name)
//        print(person.id)
//        print(person.image)
    } //: save func
    
    func loadInfo() {
        
    }
} //: ContentView

struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView()
    }
}
