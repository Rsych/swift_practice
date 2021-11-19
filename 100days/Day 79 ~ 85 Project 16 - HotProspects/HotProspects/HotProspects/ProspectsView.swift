//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Ryan J. W. Kim on 2021/11/05.
//

import SwiftUI
import CodeScanner
import UserNotifications

struct ProspectsView: View {
    // MARK: - Properties
    enum FilterType {
        case none, contacted, uncontacted
    } //: Filtertype enum
    
    @EnvironmentObject var prospects: Prospects
    @State private var isShowingScanner = false
    @State private var showingActionSheet = false
    @State private var usingSort = false

    let filter: FilterType
    
    var title: String {
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted people"
        case .uncontacted:
            return "Uncontacted people"
        }
    } //: computed properties with switch
    
    var icon: Image {
        switch filter {
        case .none:
            return Image(systemName: "person")
        case .contacted:
            return Image(systemName: "person.fill.checkmark")
        case .uncontacted:
            return Image(systemName: "person.fill")
        }
    }
    var randomSimulationData: String {
        return ["Apple \napple@fruit.farm",
                "Banana \nbanana@fruit.farm",
                "Mango \nmango@fruit.farm",
                "Zebra \nzebra@anmimal.safari"].randomElement()!
    }
    
    var filteredProspects: [Prospect] {
        var list: [Prospect]
        
        switch filter {
        case .none:
            list = prospects.people
        case .contacted:
            list = prospects.people.filter{ $0.isContacted }
        case .uncontacted:
            list = prospects.people.filter { !$0.isContacted }
        }
        if usingSort {
            list = list.sorted(by: >)
        }
        return list
        
    }
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredProspects) { prospect in
                    HStack {
                    VStack(alignment: .leading) {
                        Text(prospect.name)
                            .font(.headline)
                        Text(prospect.emailAddress)
                            .foregroundColor(.secondary)
                    } //: Vstack
                    
                        if prospect.isContacted {
                            Image(systemName: "person.fill.checkmark")
                        } else { Image(systemName: "person.fill") }
                        
                    } //: HStack
                    .contextMenu {
                        Button(prospect.isContacted ? "Mark Uncontacted" : "Mark Contacted") {
                            self.prospects.toggle(prospect)
                        }

                        if !prospect.isContacted {
                            Button {
                                addNotification(for: prospect)
                            } label: {
                                Text("Remind me")
                            }

                        }
                    } //: ContextMenu
                } //: Loop
            } //: List
            
            .navigationTitle(title)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // for test
//                        let prospect = Prospect()
//                        prospect.name = "Ryan"
//                        prospect.emailAddress = "aliefj@gmail.com"
//                        self.prospects.people.append(prospect)
                        isShowingScanner.toggle()
                    } label: {
                        Label("Scan", systemImage: "qrcode.viewfinder")
                    }
                    
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        showingActionSheet = true
                    } label: {
                        Text("Sort")
                    }
                    .confirmationDialog("Sort", isPresented: $showingActionSheet, titleVisibility: .hidden) {
                                    Button("Sort by name") {
                                        usingSort = true
                                        //
                                    }
                                    Button("Sort by date") {
                                        usingSort = false
                                    }
                                } //: ConfirmationDialog
                }
                
            } //: toolbar
            .sheet(isPresented: $isShowingScanner) {
                CodeScannerView(codeTypes: [.qr], simulatedData: randomSimulationData, completion: self.handleScan)
            } //: qrscanner sheet
            
        } //: NAV View
    } //: body
    func handleScan(result: Result<String, CodeScannerView.ScanError>) {
        isShowingScanner = false
        
        switch result {
        case .success(let code):
            let details = code.components(separatedBy: "\n")
            guard details.count == 2 else { return }
            
            let person = Prospect()
            person.name = details[0]
            person.emailAddress = details[1]
            self.prospects.add(person)
            
        case .failure(let error):
            print("Scan fail \(error)")
        }
    } //: scan handler func
    
    func addNotification(for prospect: Prospect) {
        let center = UNUserNotificationCenter.current()
        
        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = "Contact \(prospect.name)"
            content.subtitle = prospect.emailAddress
            content.sound = UNNotificationSound.default
            
            // trigger
//            var dateComponents = DateComponents()
//            dateComponents.hour = 9
//            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            
            // for test 5second pass triger
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
        }
        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                addRequest()
            } else {
                center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        addRequest()
                    } else {
                        print("errr")
                    }
                }
            }
        }
    } //: Add notification func
    
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
    }
}
