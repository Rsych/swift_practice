//
//  RatingVIew.swift
//  Bookworm
//
//  Created by Ryan J. W. Kim on 2021/10/23.
//

import SwiftUI

struct RatingVIew: View {
    // MARK: - Properties
    @Binding var rating: Int
    
    var label = ""
    var maximumRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    
    // MARK: - Body
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            } //: conditional
            
            ForEach(1..<maximumRating + 1) { number in
                self.image(for: number)
                    .foregroundColor(number > self.rating ? self.offColor : self.onColor)
                    .onTapGesture {
                        self.rating = number
                    }
            }//: Loop
        }//: HStack
    }//: BOdy
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

struct RatingVIew_Previews: PreviewProvider {
    static var previews: some View {
        RatingVIew(rating: .constant(4))
    }
}
