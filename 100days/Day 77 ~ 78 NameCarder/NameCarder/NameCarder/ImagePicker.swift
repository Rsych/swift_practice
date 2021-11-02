//
//  ImagePicker.swift
//  NameCarder
//
//  Created by Ryan J. W. Kim on 2021/11/02.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        
        return picker
    }
}
