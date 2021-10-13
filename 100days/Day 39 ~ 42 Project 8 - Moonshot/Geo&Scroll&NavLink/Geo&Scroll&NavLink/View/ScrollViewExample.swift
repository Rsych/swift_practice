//
//  ScrollView.swift
//  Geo&Scroll&NavLink
//
//  Created by Ryan J. W. Kim on 2021/10/12.
//

import SwiftUI
// MARK: - CustomText Struct
struct CustomText: View {
    var text: String
    var body: some View {
        Text(text)
    }
    init(_ text: String) {
        print("Creating a customText")
        self.text = text
    }
}
// MARK: - ScrollView Example view
struct ScrollViewExampl: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 10) {
                ForEach(0..<100) { row in
                    NavigationLink("Detail \(row)") {
                        CustomText("Item\(row)")
                    }
                } //: Loop
            } //: Vstack
            .frame(maxWidth: .infinity)
            .navigationTitle("Scroll View")
        } //: ScrollView
    }
}
// MARK: - ListView Example View
struct ListViewExample: View {
    var body: some View {
        List(0..<100){ row in
            NavigationLink("Detail \(row)") {
                CustomText("\(row)")
            } //: NavigationLink
            .navigationTitle("List View")
        } //: List VIew
    }
}
// MARK: - Main View
struct ScrollViewExample: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        NavigationView{
            VStack{
                HStack(alignment: .top, spacing: 10, content: {
                    NavigationLink("Scroll View") {
                        
                        ScrollViewExampl()
                    } //: NavigationLink
                    
                    NavigationLink("List View") {
                        ListViewExample()
                    } //: NavigationLink
                }) //: Hstack
                    .font(.largeTitle)
                Spacer()
                Text("Scroll View creates all customText immediately\n")
                Text("List View creates customText only when it needs")
                    .font(.body)
                Spacer()
            } //: Vstack
            .navigationTitle("Views")
            
        } //: NavigationView
    } //: Body
}


struct ScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewExample()
    }
}
