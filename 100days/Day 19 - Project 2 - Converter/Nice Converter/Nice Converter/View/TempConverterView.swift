//
//  ConverterView.swift
//  Nice Converter
//
//  Created by Ryan J. W. Kim on 2021/09/30.
//

import SwiftUI

struct TempConverterView: View {
    // MARK: - Properties
    @State private var inputValue = ""
    @State private var outputValue = ""
    
    @State private var inputUnitValue = 0
    let inputUnits = ["°C", "°F", "K"]
    
    @State private var outputUnitValue = 0
    let outputUnits = ["°C", "°F", "K"]
    
    var calculatedOut: String {
        var output = ""
        var input = Measurement(value: 0, unit: UnitTemperature.celsius)
        switch inputUnits[inputUnitValue] {
        case "°C":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitTemperature.celsius)
        case "°F":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitTemperature.fahrenheit)
        default:
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitTemperature.kelvin)
        }
        switch outputUnits[outputUnitValue] {
        case "°C":
            output = String(describing: input.converted(to: UnitTemperature.celsius))
        case "°F":
            output = String(describing: input.converted(to: UnitTemperature.fahrenheit))
        default:
            output = String(describing: input.converted(to: UnitTemperature.kelvin))
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
            .navigationTitle("Temperature converter")
        } //: NavigationView
        
    }
}
// MARK: - Preview
struct ConverterView_Previews: PreviewProvider {
    static var previews: some View {
        TempConverterView()
            .previewLayout(.sizeThatFits)
    }
}


