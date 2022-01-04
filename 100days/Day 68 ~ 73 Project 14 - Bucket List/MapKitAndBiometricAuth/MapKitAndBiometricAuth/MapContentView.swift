//
//  MapContentView.swift
//  MapKitAndBiometricAuth
//
//  Created by Ryan J. W. Kim on 2021/10/31.
//

import SwiftUI

struct MapContentView: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        MapView()
            .edgesIgnoringSafeArea(.all)
    }
}

struct MapContentView_Previews: PreviewProvider {
    static var previews: some View {
        MapContentView()
    }
}
