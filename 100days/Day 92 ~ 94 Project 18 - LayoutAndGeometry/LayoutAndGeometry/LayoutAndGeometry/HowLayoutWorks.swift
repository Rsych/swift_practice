//
//  HowLayoutWorks.swift
//  LayoutAndGeometry
//
//  Created by Ryan J. W. Kim on 2021/11/12.
//

import SwiftUI

struct HowLayoutWorks: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        VStack {
        Text("Padding 20 and background red")
            .padding(20)
            .background(Color.red)
            
            Text("Background red and Padding 20")
                .background(Color.red)
                .padding(20)
        } //: VStack
    } //: body
} //: contentview

struct HowLayoutWorks_Previews: PreviewProvider {
    static var previews: some View {
        HowLayoutWorks()
    }
}
