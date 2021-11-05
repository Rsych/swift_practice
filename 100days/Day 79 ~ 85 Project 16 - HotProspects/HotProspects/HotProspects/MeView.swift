//
//  MeView.swift
//  HotProspects
//
//  Created by Ryan J. W. Kim on 2021/11/05.
//

import SwiftUI
import CoreImage.CIFilterBuiltins


struct MeView: View {
    // MARK: - Properties
    @State private var name = ""
    @State private var emailAddress = ""
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            VStack {
                
                TextField("Name", text: $name, prompt: Text("Your name"))
                    .textContentType(.name)
                    .font(.title)
                    .padding(.horizontal)
                
                TextField("Email address", text: $emailAddress, prompt: Text("your@email.com"))
                    .textContentType(.emailAddress)
                    .font(.title)
                    .padding([.horizontal, .bottom])
                
                Image(uiImage: generateQRCode(from: "\(name)\n\(emailAddress)"))
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                Spacer()
            } //: VStack
            .navigationTitle("Your code")
        } //: NAV View
    } //: body
    
    func generateQRCode(from string: String) -> UIImage {
        let data = Data(string.utf8)
        filter.setValue(data, forKey: "inputMessage")
        
        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    } //: QRCode generator func
}

struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView()
    }
}
