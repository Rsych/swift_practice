//
//  ForEachSelf.swift
//  CoreDataProj
//
//  Created by Ryan J. W. Kim on 2021/10/26.
//

import SwiftUI

struct Student: Hashable {
    let name: String
}

struct ForEachSelf: View {
    // MARK: - Properties
    let students = [Student(name: "Harry Potter"), Student(name: "Hermione Granger")]
    
    // MARK: - Body
    var body: some View {
        List(students, id: \.self) { student in
            Text(student.name)
        }
    }
}

struct ForEachSelf_Previews: PreviewProvider {
    static var previews: some View {
        ForEachSelf()
    }
}
