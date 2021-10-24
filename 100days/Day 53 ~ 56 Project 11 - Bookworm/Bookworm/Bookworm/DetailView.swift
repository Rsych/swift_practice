//
//  DetailView.swift
//  Bookworm
//
//  Created by Ryan J. W. Kim on 2021/10/24.
//
import CoreData
import SwiftUI

struct DetailView: View {
    // MARK: - Properties
    let book: Book
    
    // MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    Image(book.genre ?? "Fantasy")
                        .frame(maxWidth: geometry.size.width)
                    
                    Text(book.genre?.uppercased() ?? "FANTASY")
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(8)
                        .foregroundColor(.white)
                        .background(Color.black.opacity(0.75))
                        .clipShape(Capsule())
                        .offset(x: -5, y: -5)
                }//: ZStack
                Text(book.author ?? "Unknown author")
                    .font(.title)
                    .foregroundColor(.secondary)
                Text(book.review ?? "No Review")
                    .padding()
                RatingVIew(rating: .constant(Int(book.rating)))
                    .font(.largeTitle)
                Spacer()
            }//: VStack
        } //: GeometryReader
        .navigationTitle(Text(book.title ?? "Unknown Book"))
        .navigationBarTitleDisplayMode(.inline)
    }//: Body
}//: contentview

// MARK: - Preview
struct DetailView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    static var previews: some View {
        let book = Book(context: moc)
        book.title = "Test Book"
        book.author = "Test author"
        book.rating = 4
        book.genre = "Fantasy"
        book.review = "This was good book"
        
        return NavigationView {
            DetailView(book: book)
        }
    }
}
