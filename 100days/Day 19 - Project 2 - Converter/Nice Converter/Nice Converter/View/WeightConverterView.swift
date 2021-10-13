//
//  WeightConverterView.swift
//  Nice Converter
//
//  Created by Ryan J. W. Kim on 2021/09/30.
//

import SwiftUI

struct WeightConverterView: View {
    // MARK: - Properties
    @State private var inputValue = ""
    @State private var outputValue = ""
    
    @State private var inputUnitValue = 0
    let inputUnits = ["kg", "oz", "lb"]
    
    @State private var outputUnitValue = 0
    let outputUnits = ["kg", "oz", "lb"]
    
    var calculatedOut: String {
        var output = ""
        var input = Measurement(value: 0, unit: UnitMass.kilograms)
        switch inputUnits[inputUnitValue] {
        case "kg":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitMass.kilograms)
        case "oz":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitMass.ounces)
        default:
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitMass.pounds)
        }
        switch outputUnits[outputUnitValue] {
        case "kg":
            output = String(describing: input.converted(to: UnitMass.kilograms))
        case "oz":
            output = String(describing: input.converted(to: UnitMass.ounces))
        default:
            output = String(describing: input.converted(to: UnitMass.pounds))
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
            .navigationTitle("Weight converter")
        } //: NavigationView
        
    }
}

// MARK: - Preview
struct WeightConverterView_Previews: PreviewProvider {
    static var previews: some View {
        WeightConverterView()
    }
}
