//
//  ContentView.swift
//  showHideViews
//
//  Created by Ryan J. W. Kim on 2021/10/09.
//

import SwiftUI

struct User: Codable {
    var firstName: String
    var lastname: String
}

struct ContentView: View {
    // MARK: - Properties
    @State private var isShowingSheet = false
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    @State private var user = User(firstName: "Taylor", lastname: "Swift")
    
    // MARK: - Body
    var body: some View {
        VStack {
            
            Button {
                let encoder = JSONEncoder()
                
                if let data = try? encoder.encode(self.user){
                    UserDefaults.standard.set(data, forKey: "UserData")
                    print(user)
                }
            } label: {
                Text("Save user")
            }

            Button {
                tapCount += 1
                UserDefaults.standard.set(tapCount, forKey: "Tap")
            } label: {
                Text("Tap count: \(tapCount)")
            }

        Text("Hello, world!")
            .padding()
            Button {
                isShowingSheet.toggle()
            } label: {
                Text("Show sheet")
            }
            .sheet(isPresented: $isShowingSheet) {
                // dismiss func
            } content: {
                SecondView(name: "Ryan")
            }


        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13")
    }
}
