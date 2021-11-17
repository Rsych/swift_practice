//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Ryan J. W. Kim on 2021/11/16.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            List(resorts) { resort in
                NavigationLink {
                    // destination
                    ResortView(resort: resort)
                } label: {
                    Image(resort.country)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 25)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .overlay(RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.black, lineWidth: 1))
                    VStack(alignment: .leading, spacing: nil) {
                        Text(resort.name)
                            .font(.headline)
                        Text("\(resort.runs) runs")
                            .foregroundColor(.secondary)
                    } //: Vstack for name and runs
                } //: NavLink
            } //: List
            .navigationBarTitle("Resorts")
            // secondary view
            WelcomeView()
        } //: NavView
        .phoneOnlyStackNavigationView()
    } //: body
} //: contentview

extension View {
    func phoneOnlyStackNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return AnyView(self.navigationViewStyle(.stack))
        } else {
            return AnyView(self)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11 Pro")
    }
}
