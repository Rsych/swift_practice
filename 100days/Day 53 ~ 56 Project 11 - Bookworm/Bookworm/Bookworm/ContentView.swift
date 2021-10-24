//
//  ContentView.swift
//  Bookworm
//
//  Created by Ryan J. W. Kim on 2021/10/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Book.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Book.title, ascending: true),
        NSSortDescriptor(keyPath: \Book.author, ascending: true)
    ]) var books: FetchedResults<Book>
    
    @State private var showingAddScreen = false
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            List {
                ForEach(books, id: \.self) { book in
                    NavigationLink(destination: DetailView(book: book)) {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                        }//: NAV link
                        VStack(alignment: .leading, spacing: nil) {
                            Text(book.title ?? "Unknown title")
                                .font(.headline)
                            Text(book.author ?? "Unknown author")
                                .foregroundColor(.secondary)
                        }//: VStack
                    }//: HStack
                }//: Loop
                .onDelete(perform: deleteBooks) //: Delete
            }//: List
            .navigationTitle("Bookworm")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.showingAddScreen.toggle()
                    } label: {
                        Image(systemName: "plus")
                    } //: Button
                } //: NavBarTrailing
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                } //: Edit(Delete)
            }//: Toolbar
            .sheet(isPresented: $showingAddScreen) {
                AddBookView().environment(\.managedObjectContext, self.moc)
            } //: Sheet to load AddBookView
        }//: NavView
    }//: Body
    func deleteBooks(at offSets: IndexSet) {
        for offSet in offSets {
            let book = books[offSet]
            moc.delete(book)
        }
        try? moc.save()
    } //: Delete function
}//: ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
