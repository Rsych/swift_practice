//
//  CoreData.swift
//  BindingAnyViewCoreData
//
//  Created by Ryan J. W. Kim on 2021/10/23.
//

import SwiftUI


struct CoreData: View {
    // MARK: - Preview
    @FetchRequest(entity: Student.entity(), sortDescriptors: []) var students: FetchedResults<Student>
    
    @Environment(\.managedObjectContext) var moc
    // MARK: - Body
    var body: some View {
        VStack {
            List {
                ForEach(students, id: \.id) { student in
                    Text(student.name ?? "Unknown")
                }//: Loop
            } //: List
            Button {
                
                let firstNames = ["Ryan", "Ahmed", "Oleg", "Furkan"]
                let lastNames = ["R", "A", "O", "F"]
                
                let chosenFirstName = firstNames.randomElement()!
                let chosenLastName = lastNames.randomElement()!
                
                let student = Student(context: moc)
                
                student.id = UUID()
                student.name = "\(chosenFirstName) \(chosenLastName)"
                
                try? moc.save()
                
                
            } label: {
                Text("Add")
            }
            
        }//: VStack
    }//: Body
}//: contentView

struct CoreData_Previews: PreviewProvider {
    static var previews: some View {
        CoreData()
    }
}
