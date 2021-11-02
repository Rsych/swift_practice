//
//  NameListView.swift
//  NameCarder
//
//  Created by Ryan J. W. Kim on 2021/11/02.
//

import SwiftUI

struct NameListView: View {
    // MARK: - Properties
    //    @ObservedObject var person: Person
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Person.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Person.name, ascending: true)]) var persons: FetchedResults<Person> // wait for update
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            List {
                ForEach(persons, id: \.self) { person in
                    NavigationLink(destination: DetailView(person: person)) {
                        HStack {
                            Image(uiImage: UIImage(data: person.image ?? Data()) ?? UIImage())
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                            Text(person.name ?? "Unknown")
                        } //: Hstack
                    } //: NAV LINK
                } //: Loop
                .onDelete(perform: deleteName)
            } //: List
            
                        .navigationTitle("Name List")
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                EditButton()
                            }
                        }
            
            
        } //: NavView
    } //: body
    func deleteName(at offsets: IndexSet) {
        for offset in offsets {
            let person = persons[offset]
            moc.delete(person)
        }
        try? moc.save()
    }
    
} //: Contentview

struct NameListView_Previews: PreviewProvider {
    //    static var example = Person
    static var previews: some View {
        NameListView()
    }
}
