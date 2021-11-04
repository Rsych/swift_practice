//
//  NSManagedOBJContextConditionalSaving.swift
//  CoreDataProj
//
//  Created by Ryan J. W. Kim on 2021/10/26.
//

import SwiftUI

struct NSManagedOBJContextConditionalSaving: View {
    // MARK: - Properties
    @Environment(\.managedObjectContext) var moc
    
    // MARK: - Body
    var body: some View {
        Button {
            if self.moc.hasChanges {
                try? self.moc.save()
            }
        } label: {
            Text("Save")
        }

    }
}

struct NSManagedOBJContextConditionalSaving_Previews: PreviewProvider {
    static var previews: some View {
        NSManagedOBJContextConditionalSaving()
    }
}
