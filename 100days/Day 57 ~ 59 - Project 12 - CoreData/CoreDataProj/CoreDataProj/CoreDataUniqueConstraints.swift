//
//  CoreDataUniqueConstraints.swift
//  CoreDataProj
//
//  Created by Ryan J. W. Kim on 2021/10/26.
//

import SwiftUI

struct CoreDataUniqueConstraints: View {
    // MARK: - Properteis
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Wizard.entity(), sortDescriptors: []) var wizards: FetchedResults<Wizard> // wait for update
    
    // MARK: - Body
    var body: some View {
        VStack {
        List(wizards, id: \.self) { wizard in
            Text(wizard.wizName ?? "Unknown")
        } //: List
        Button {
            let wizzard = Wizard(context: self.moc)
            wizzard.wizName = "Harry potter"
        } label: {
            Text("Save")
        } //: Button
        } //: VStack
    } //: Body
}

struct CoreDataUniqueConstraints_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataUniqueConstraints()
    }
}
