//
//  EditCards.swift
//  FlashZilla
//
//  Created by Ryan J. W. Kim on 2021/11/11.
//

import SwiftUI

struct EditCards: View {
    // MARK: - Properties
    @Environment(\.presentationMode) var presentationMode
    @State private var cards = [Card]()
    @State private var newPrompt = ""
    @State private var newAnswer = ""
    // MARK: - Body
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Prompt", text: $newPrompt)
                    TextField("Answer", text: $newAnswer)
                } header: {
                    Text("Add new card")
                } footer: {
                    Button {
                        addCard()
                    } label: {
                        Text("Add card")
                    } //: add button

                } //: Section
                
                Section {
                    ForEach(0..<cards.count, id: \.self) { index in
                        VStack(alignment: .leading) {
                            Text(cards[index].prompt)
                                .font(.headline)
                            Text(cards[index].answer)
                                .foregroundColor(.secondary)
                        }
                    } //: Loop
                    .onDelete(perform: removeCards)
                } //: Section
            } //: List
            .navigationTitle("Edit Cards")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Done")
                    } //: Done button
                } //: - ToolbarItem
            } //: Toolbar
            .listStyle(GroupedListStyle())
            .onAppear(perform: loadData)
        } //: NavView
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
    func loadData() {
        if let data = UserDefaults.standard.data(forKey: "Cards") {
            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
            cards = decoded
            }
        }
    }
    func saveData() {
        if let data = try? JSONEncoder().encode(cards) {
            UserDefaults.standard.set(data, forKey: "Cards")
        }
    }
    func addCard() {
        let trimmedPrompt = newPrompt.trimmingCharacters(in: .whitespaces)
        let trimmedAnswer = newAnswer.trimmingCharacters(in: .whitespaces)
        guard trimmedPrompt.isEmpty == false &&
                trimmedAnswer.isEmpty == false else { return }
        
        let card = Card(prompt: trimmedPrompt, answer: trimmedAnswer)
        cards.insert(card, at: 0)
        saveData()
    }
    func removeCards(at offsets: IndexSet) {
        cards.remove(atOffsets: offsets)
        saveData()
    }
}

struct EditCards_Previews: PreviewProvider {
    static var previews: some View {
        EditCards()
.previewInterfaceOrientation(.landscapeLeft)
    }
}
