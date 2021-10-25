//
//  AddBookView.swift
//  Bookworm
//
//  Created by Ryan J. W. Kim on 2021/10/23.
//

import SwiftUI

struct AddBookView: View {
    // MARK: - Properties
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Others"
    @State private var review = ""
    @State private var date = Date()
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller", "Others"]
    
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of Book", text: $title)
                    TextField("Author's name", text: $author)
                        
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        } //: Loop
                    } //: Picker
                }//: Section
                Section {
                    RatingVIew(rating: $rating)
                    TextField("Write a review", text: $review)
                }//: Section
                Section {
                    Button {
                        let newBook = Book(context: self.moc)
                        newBook.title = self.title
                        newBook.author = self.author
                        newBook.rating = Int16(self.rating)
                        newBook.genre = self.genre
                        newBook.review = self.review
                        newBook.date = self.date
                        
                        try? self.moc.save()
                        
                        self.presentationMode.wrappedValue.dismiss()
                        
                    } label: {
                        Text("Save")
                    } //: Button
                } //: Section
            } //: Form
            .navigationTitle("Add Book")
        }//: Nav view
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
