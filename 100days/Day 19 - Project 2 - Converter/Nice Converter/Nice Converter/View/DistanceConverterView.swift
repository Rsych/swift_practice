//
//  DistanceView.swift
//  Nice Converter
//
//  Created by Ryan J. W. Kim on 2021/09/30.
//

import SwiftUI

struct DistanceConverterView: View { // MARK: - Properties
    @State private var inputValue = ""
    @State private var outputValue = ""
    
    @State private var inputUnitValue = 0
    let inputUnits = ["km", "ft", "mi"]
    
    @State private var outputUnitValue = 0
    let outputUnits = ["km", "ft", "mi"]
    
    var calculatedOut: String {
        var output = ""
        var input = Measurement(value: 0, unit: UnitLength.meters)
        switch inputUnits[inputUnitValue] {
        case "km":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.kilometers)
        case "ft":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.feet)
        default:
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.miles)
        }
        switch outputUnits[outputUnitValue] {
        case "km":
            output = String(describing: input.converted(to: UnitLength.meters))
        case "mi":
            output = String(describing: input.converted(to: UnitLength.miles))
        default:
            output = String(describing: input.converted(to: UnitLength.feet))
        }
        return output
    }
    
    // MARK: - Body
    var body: some View {
        NavigationView{
            Form {
                Section{
                    TextField("Input", text: $inputValue)
                        .keyboardType(.decimalPad)
                    Picker("Unit", selection: $inputUnitValue) {
                        ForEach(0 ..< inputUnits.count) {
                            Text("\(self.inputUnits[$0])")
                        } //: Loop
                    } //: Picker
                    .pickerStyle(.segmented)
                } //: Input section
                Section(header:Text("Select Output unit")){
                    Text("\(calculatedOut)")
                    Picker("Unit", selection: $outputUnitValue) {
                        ForEach(0 ..< outputUnits.count) {
                            Text("\(self.outputUnits[$0])")
                        } //: Loop
                    } //: Picker
                    .pickerStyle(.segmented )
                } //: Output section
            } //: Form
            .navigationTitle("Distance converter")
        } //: NavigationView
        
    }
}

// MARK: - Preview
struct DistanceConverterView_Previews: PreviewProvider {
    static var previews: some View {
        DistanceConverterView()
    }
}
