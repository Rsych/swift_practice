//
//  DetailView.swift
//  NameCarder
//
//  Created by Ryan J. W. Kim on 2021/11/02.
//

import SwiftUI
import CoreData

struct DetailView: View {
    // MARK: - Properties
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    let person: Person
    // MARK: - Body
    var body: some View {
        VStack {
            Text(person.name ?? "NA")
            Image(uiImage: UIImage(data: person.image ?? Data()) ?? UIImage())
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    static var previews: some View {
        let person = Person(context: moc)
        person.id = UUID()
        person.name = "DD"
        
        
        return NavigationView {
            DetailView(person: person)
        }
    }
}
