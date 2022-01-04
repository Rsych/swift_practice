//
//  ContentView.swift
//  Proejct 4
//
//  Created by Ryan J. W. Kim on 2021/10/05.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State private var sleepAmount = 8.0
    @State private var wakeUP = defaultWakeTime
    @State private var coffeeAmont = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    
    // MARK: - Body
    var body: some View {
        NavigationView{
            Form{
                Section {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    DatePicker("Please enter a time", selection: $wakeUP,
                               displayedComponents: .hourAndMinute) //: Date picker
                    
                        .labelsHidden()
                        .datePickerStyle(.wheel)
                    
                } //: 1st Vstack
                
                Section {
                    Text("Desired amount of sleep")
                    Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                        Text("\(sleepAmount, specifier: "%g") hours")
                    } //: time stepper
                } //: 2nd Vstack
                
                Section {
                    Text("Daily coffee intake")
                        .font(.headline)
                    Picker("Coffee", selection: $coffeeAmont) {
                        ForEach(0..<20) {
                            if coffeeAmont <= 1 {
                                Text("\($0) cup")
                            } else {
                                Text("\($0) cups")
                            }
                        }
                        if coffeeAmont == 1 {
                            Text("1 cup")
                        } else {
                            Text("\(coffeeAmont) cups")
                        }
                    
                    }
//                    Stepper(value: $coffeeAmont, in: 1...20, step: 1) {
//                        if coffeeAmont == 1 {
//                            Text("1 cup")
//                        } else {
//                            Text("\(coffeeAmont) cups")
//                        }
//                    } //: Coffee stepper
                    
                    
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("Ok")))
                    } //: alert
                } //: 3rd Vstack
                
            } //: Form
            .navigationTitle("BetterRest")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: calculateBedtime) {
                        Text("Calculate")
                    } //: Button
                } //: ToolbarItem
            } //: Toolbar
        } //: Navigationview
        
    } //: Body
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    
    func calculateBedtime() {
        let model = SleepCalculator()
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUP)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        
        do {
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmont))
            
            let sleepTime = wakeUP - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            
            alertMessage = formatter.string(from: sleepTime)
            alertTitle = "Your ideal bedtime is..."
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
            
        }
        showingAlert = true
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13")
    }
}
