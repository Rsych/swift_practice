//
//  WritindDataToDocuments.swift
//  MapKitAndBiometricAuth
//
//  Created by Ryan J. W. Kim on 2021/10/31.
//

import SwiftUI

struct WritindDataToDocuments: View {
    // MARK: - Properties
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    } //: get Documents directory func
    
    
    // MARK: - Body
    var body: some View {
        VStack {
        Text("Tap here to check")
            .onTapGesture {
                let str = "Test Message"
                let url = self.getDocumentsDirectory().appendingPathComponent("message.txt")
                
                do {
                    try str.write(to: url, atomically: true, encoding: .utf8)
                    let input = try String(contentsOf: url)
                    print(input)
                } catch {
                    print(error.localizedDescription)
                }
            } // MARK: - write data
            Spacer()
            
        Text("Filemanager Bundle")
                .onTapGesture {
                    let str2 = "Test 2"
                    let path2 = FileManager.default.documentDirectory().appendingPathComponent("message2.txt")
                    do {
                        try str2.write(to: path2, atomically: true, encoding: .utf8)
                        let input2 = try String(contentsOf: path2)
                        print(input2)
                    } catch {
                        print(error.localizedDescription)
                    }
                } //: Save to documents directory
        }
    }
}

struct WritindDataToDocuments_Previews: PreviewProvider {
    static var previews: some View {
        WritindDataToDocuments()
    }
}
