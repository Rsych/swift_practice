//
//  ProductItemView.swift
//  Touchdown
//
//  Created by Ryan J. W. Kim on 2021/09/21.
//

import SwiftUI

struct ProductItemView: View {
    let product: Product
    // MARK: - property
    
    // MARK: - body
    var body: some View {
        VStack(alignment: .leading, spacing: 6, content: {
            // PHOTO
            ZStack {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .padding(10)
            }
            .background(Color(red: product.red, green: product.green, blue: product.blue), alignment: .center)
            .cornerRadius(12)
            // Name
            Text(product.name)
                .font(.title3)
                .fontWeight(.black)
            
            // Price
            Text(product.formattedPrice)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
        }) //: Vstack
    }
}


// MARK: - preview
struct ProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductItemView(product: products[0])
            .previewLayout(.fixed(width: 200, height: 300))
            .padding()
            .background(colorBackground)
    }
}
 
